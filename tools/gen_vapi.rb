if MRB_INCLUDE_DIR = ENV["MRB_INCLUDE_DIR"]
elsif system "pkg-config --cflags mruby > /dev/null"
  MRB_INCLUDE_DIR = `pkg-config --cflags mruby`.strip.gsub(/^\-I/,'')
end

TYPES = {
  :"char*" => "char*",
  mrb_int:"int",
  mrb_bool:"bool",
  mrb_value:"Value",
  mrb_float:"float",
  :"const char*"=>"string",
  void:"void",
  :"struct RClass*"=>"void*",
  :"void*"=>"void*",
  :"mrb_state*"=>"Context",
  size_t:"size_t",
  mrb_func_t:"mrb_func",
  mrb_aspec:"uint32",
  mrb_sym:"mrb_sym",
  :"const mrb_value*" => "Value[]",
  :"struct RProc*" => "void*",
  :Context=>"Context",
}

METHS = []

class Arg
  attr_accessor :type
  attr_accessor :name
end

class IMeth
  attr_accessor :source
  attr_accessor :header
  attr_accessor :rtype
  attr_accessor :args
  attr_accessor :symbol
end
S = StringIO.new()
def puts s
  S.puts s
end
Dir.glob(File.join(MRB_INCLUDE_DIR, "mruby", "*.h")).push(File.join(MRB_INCLUDE_DIR, "mruby.h")).each do |f|
  File.read(f).each_line do |l|
    if l =~ /\(.*\).*\(/
      STDERR.puts "// #{l}"
      next
    end
    if l.strip.gsub("MRB_API","") =~ /(.*) (.*?)\(mrb_state(.*?)\)*\;/
      ar = $3.strip.split(",")
      ar.shift
      ar = ar.join(",")
      ret, fun, args = [$1.strip, $2.strip, ar]
      if ret =~ / \*/
        ret = ret.split(" ")
        ret.pop
        ret = ret.join(" ")+"*"
      elsif fun =~ /^\*/
        ret = ret+"*"
        fun = fun.gsub(/^\*/,"")
      end
      
      ret = ret.to_sym
      
      if !TYPES[ret]
        STDERR.puts "// #{l}"
        next
      end
      
      vnames = 0;
      margs = args.split(",").map do |a|
        raw = a.strip.split(" ");
        name = raw.pop
        type = raw.join(" ")

        if TYPES[a.strip.to_sym] or a =~/\*$/
          name = "foo#{vnames += 1}"
          t = a.split(" ")
          q = t.pop
          if q == "*"
            type = t.join(" ")+"*"
          else
            type = a
          end
        
        elsif name =~ /^\*/
          type = type + "*"
          name = name.gsub(/^\*/,'')
        end

        arg = Arg.new
        arg.type = type.strip.to_sym
        arg.name = name
        arg
      end
      
      if margs.find do |a|
        !TYPES[a.type]
      end
        STDERR.puts "// BAD_ARGS // #{margs.map do |a| a.type end.join(", ")} #{l}"
        next
      end
      
      m = IMeth.new
      m.rtype = ret.to_sym
      m.args = margs
      m.symbol = fun
      m.source = l
      m.header = File.basename(f) == "mruby.h" ? "mruby.h" : "mruby/#{File.basename(f)}"
      METHS << m
    end
  end
end

c=File.open("src/context.vala","w")
o = File.open("src/object.vala","w")
r = File.open("src/array.vala", "w")
s = File.open("src/string.vala", "w")

puts "[CCode (cprefix = \"mrb_\", cheader_filename = \"mruby.h\", gir_namespace = \"MRb\", gir_version = \"0.1\")]"
puts "namespace MRb {"
puts """

	public enum vtype {
	  FALSE = 0,   /*   0 */
	  FREE,        /*   1 */
	  TRUE,        /*   2 */
	  FIXNUM,      /*   3 */
	  SYMBOL,      /*   4 */
	  UNDEF,       /*   5 */
	  FLOAT,       /*   6 */
	  CPTR,        /*   7 */
	  OBJECT,      /*   8 */
	  CLASS,       /*   9 */
	  MODULE,      /*  10 */
	  ICLASS,      /*  11 */
	  SCLASS,      /*  12 */
	  PROC,        /*  13 */
	  ARRAY,       /*  14 */
	  HASH,        /*  15 */
	  STRING,      /*  16 */
	  RANGE,       /*  17 */
	  EXCEPTION,   /*  18 */
	  FILE,        /*  19 */
	  ENV,         /*  20 */
	  DATA,        /*  21 */
	  FIBER,       /*  22 */
	  MAXDEFINE;    /*  23 */
	}

"""
puts "  [CCode (has_target = false, cname=\"mrb_func_t\")]"
puts "  public delegate Value mrb_func(Context mrb, Value self);\n\n"
puts "  [SimpleType]"
puts "  [CCode (cname = \"mrb_value\")]"
puts "  public struct Value {}\n\n"
puts "  [SimpleType]"
puts "  [CCode (cname = \"mrb_sym\")]"
puts "  public struct mrb_sym {}\n\n"
puts "  [Compact]"
puts "  [CCode (cprefix = \"mrb_\", cname = \"mrb_state\", free_function = \"mrb_close\")]"
puts "  public class Context {"
puts "    public void* object_class;"
puts "    public int get_args(string fmt, ...);\n\n"
puts "    public Value float_value(float val);\n\n"
puts "    public Value cptr_value(void* val);\n\n"
puts "    public int ary_len(Value a);\n\n"
puts "    [CCode (cname = \"mrb_open\")]"
puts "    public Context();"

C_TYPES = {
  :mrb_sym=>"MRuby.Symbol",
  :Value  =>"MRuby.Object",
  :"Value[]"=>"MRuby.Value[]",
  :"Context"=>"MRuby.Context",
  :TT=>"MRuby.TT"
}

METH_OVERRIDE = {
	:obj_new => [:"MRuby.Object"],
	:ary_new => [:"MRuby.Array", "new MRuby.Array.from(ret, this);"], 
	:ary_new_from_values => [:"MRuby.Array", "new MRuby.Array.from(ret, this);"],
	:obj_as_string => [:"MRuby.String", "new MRuby.String.from(ret, this);"],	
	:str_new_cstr => [:"MRuby.String", "new MRuby.String.from(ret, this);"],	
	:str_new_str => [:"MRuby.String", "new MRuby.String.from(ret, this);"],	
	# :ary_join=> :"MRuby.String"
}

EXC = [
  :class_get,
  :module_get,
  :define_method,
  :float_value,
  :proc_new_cfunc_with_env,
  :obj_new,
  :load_string,
  :get_args,
]

OEXC = [
  :new,
  :dup,
  :clone
]

AEXC = [
  :new,
  :new_from_values,
  :new_capa,
  :ref,
  :set,
  :get
]

s.puts """
namespace MRuby {
  public class String : MRuby.Object {
    public String.from(MRb.Value act, MRuby.Context? mrb = null) {
      base.from(act, mrb);
    }
    
    public String(Context mrb, string cstr) {
	  base.from(mrb._base_.str_new_cstr(cstr), mrb);
    }

"""

s.puts """

  }
}
"""

s.close

o.puts """
namespace MRuby {
  public class Object : MRuby.Value {
    public Object.from(MRb.Value act, MRuby.Context? mrb = null) {
      base(act, mrb);
    }
    
    public Object(Context mrb, void* cls, MRuby.Value[] argv) {
      base(mrb.obj_new(cls, argv).actual, mrb);
    }
    
    public Object dup(Context? c = null) {
      unowned MRuby.Context mc = get_context(c);
      return new Object.from(mc._base_.obj_dup(this.actual), mc);
    }
    
    public Object clone(Context? c = null) {
      unowned MRuby.Context mc = get_context(c);    
      return new Object.from(mrb._base_.obj_clone(this.actual), mc);
    }    

"""


c.puts """
namespace MRuby {
  using MRb;
  public class Context : MRb.Context {
    public unowned MRb.Context _base_ {
      get {
		return (MRb.Context)this;
      }
    }
  
    public new void define_method(string name, FuncCB cb) {
      new Class(object_class).define_method(this, name, cb);
    }
    
    public new Class class_get(string name) {
      return new Class.get(this, name);
    }

    public new Module module_get(string name) {
      return new Module.get(this, name);
    }
    
    public new MRuby.Object float_value(float val) {
      return new MRuby.Object.from(((MRb.Context)this).float_value(val), this);
    }
    
    public new MRuby.Object cptr_value(void* val) {
      return new MRuby.Object.from(((MRb.Context)this).cptr_value(val), this);
    }  
    
    public new int ary_len(MRuby.Value val) {
      return ((MRb.Context)this).ary_len(val.actual);
    }         
    
    public new MRuby.Object obj_new(void* cls, MRuby.Value[] argv = {}) {
      return new MRuby.Object.from(((MRb.Context)this).obj_new(cls, (MRb.Value[])argv), this);
    }
    
    public new MRuby.Object? load_string(string str) {
      return new MRuby.Object.from(((MRb.Context)this).load_string(str), this);
    }  
       
"""

r.puts """
namespace MRuby {
  public class Array : MRuby.Object {
	public Array(MRuby.Context mrb) {
		base.from(((MRb.Context)mrb).ary_new(), mrb);
	} 
  
    public Array.from(MRb.Value act, MRuby.Context? c = null) {
      base.from(act, c);
    }
    
    public MRuby.Object context_get(int idx, MRuby.Context? c = null ) {
      unowned MRuby.Context mc = get_context(c);
      
      return mc.ary_ref(this, idx);
    }
    
    public int length {
      get {
        return MRb.RARRAY_LEN(this.actual);
      }
    }
    
    public int size {
      get {
        return MRb.RARRAY_LEN(this.actual);
      }
    }    
    
    public void context_set(int i, MRuby.Value val, MRuby.Context? ctx = null) {
		unowned MRuby.Context mc = get_context(ctx);
		mc.ary_set(this, i, val);
    }  
    
	public new void set(int i, MRuby.Value v) {
		context_set(i, v);
	}

	
	public new MRuby.Object get(int i) {
		return context_get(i);
	}
"""



METHS.each do |m|
  puts "\n    [CCode (cheader_filename = \"#{m.header}\")]"
  puts "    public #{TYPES[m.rtype]} #{m.symbol.gsub(/^mrb_/,'')}(#{m.args.map do |a| "#{t=TYPES[a.type]; t == "Value[]" ? " [CCode (array_length=false)] "+t : t} #{a.name.gsub(/^base$/, "_base")}" end.join(", ")});"
  if !EXC.index(q=m.symbol.gsub(/^mrb_/,'').to_sym)
    rt       = (METH_OVERRIDE[q] ? METH_OVERRIDE[q][0] : nil) || C_TYPES[TYPES[m.rtype].to_sym] || TYPES[m.rtype]
    atypes = []
    args_dec = m.args.map do |a| "#{atypes << at=C_TYPES[TYPES[a.type].to_sym] || TYPES[a.type]; at == "MRuby.Object" ? "MRuby.Value" : at} #{a.name.gsub(/^base$/, "_base")}" end
    
    c.puts "    public new #{rt} #{s=m.symbol.gsub(/^mrb_/,'')}(#{args_dec.join(", ")}) {\n"

    op = false;

	if rt.to_s == "MRuby.Object"
	  op = true;
	  c.print("      return new MRuby.Object.from(")
	elsif(METH_OVERRIDE[q.to_sym])
	  c.print("      var ret = ")
	elsif rt.to_s != "void"
	  c.print("      return (#{rt})")
	else
	  c.print("      ")
	end
	i=0
	invoke_args = m.args.map do |a|
	  v = atypes[i] == "MRuby.Value[]" ? "(vary2mrb(#{a.name}))" : (atypes[i] == "MRuby.Object" ? "#{a.name.gsub(/^base$/, "_base")}.actual" : a.name.gsub(/^base$/, "_base"))
	  i += 1
	  v
	end
	
	c.print "_base_.#{s}(#{invoke_args.join(", ")})"

    c.print ", this)" if op
    
    c.print(";\n\n")    
    
    if METH_OVERRIDE[q]
      c.print "      return #{METH_OVERRIDE[q][1]}\n\n" 
    end
    

    c.puts("    }\n\n")
  end
end

METHS.find_all do |m| m.symbol.to_s =~ /^mrb_obj_/ end.each do |m|
  if !OEXC.index(m.symbol.gsub(/^mrb_obj_/,'').to_sym)
    margs = m.args.clone
    margs.shift
    q = m.symbol.gsub(/^mrb_/, '').to_sym
    o.puts "    public #{(rt = (METH_OVERRIDE[q] ? METH_OVERRIDE[q][0] : nil) || C_TYPES[TYPES[m.rtype].to_sym] || TYPES[m.rtype]); rt} #{s=m.symbol.gsub(/^mrb_obj_/,'')}(#{margs.map do |a| "#{C_TYPES[TYPES[a.type].to_sym] || TYPES[a.type]} #{a.name.gsub(/^base$/, "_base")}" end.join(", ")+"#{m.args.length > 1 ? "," : ""} MRuby.Context? ctx = null"}) {"
    o.puts "      unowned MRuby.Context mc = get_context(ctx);\n\n"
    o.puts "\n      #{rt.to_s == "void" ? "" : "return "} mc.obj_#{s}(this#{margs.length >= 1 ? ", " :""} #{margs.map do |a| q = C_TYPES[TYPES[a.type].to_sym] || TYPES[a.type]; ((s = q == "MRuby.Value[]") ? "MRuby.vary2mrb(" : "") + a.name.gsub(/^base$/, "_base") + (s ? ")" : "") end.join(", ")});\n"
    o.puts("    }\n\n")
  end
end

METHS.find_all do |m| m.symbol.to_s =~ /^mrb_ary_/ end.each do |m|
  if !AEXC.index(m.symbol.gsub(/^mrb_ary_/,'').to_sym)
    margs = m.args.clone
    margs.shift
    q = m.symbol.gsub(/^mrb_/, '').to_sym
    r.puts "    public #{(rt = (METH_OVERRIDE[q] ? METH_OVERRIDE[q][0] : nil) || C_TYPES[TYPES[m.rtype].to_sym] || TYPES[m.rtype]); rt} #{s=m.symbol.gsub(/^mrb_ary_/,'')}(#{margs.map do |a| "#{C_TYPES[TYPES[a.type].to_sym] || TYPES[a.type]} #{a.name.gsub(/^base$/, "_base")}" end.join(", ")+"#{m.args.length > 1 ? "," : ""} MRuby.Context? ctx = null"}) {"
    r.puts "      unowned MRuby.Context mc = get_context(ctx);\n\n"
    r.puts "\n      #{rt.to_s == "void" ? "" : "return "} mc.ary_#{s}(this#{margs.length >= 1 ? ", " :""} #{margs.map do |a| q = C_TYPES[TYPES[a.type].to_sym] || TYPES[a.type]; ((s = q == "MRuby.Value[]") ? "MRuby.vary2mrb(" : "") + a.name.gsub(/^base$/, "_base") + (s ? ")" : "") end.join(", ")});\n"
    r.puts("    }\n\n")
  end
end



c.puts "  }\n}\n\n"
c.close

o.puts "  }\n}\n\n"
o.close

r.puts "  }\n}\n\n"
r.close

puts "  }\n\n"

puts <<-EOC
  public Value bool_value(bool val);
  public Value fixnum_value(int val);
  public Value float_value(Context mrb, float val);
  public Value nil_value();
  public void* nil_p(Value v);
  public Value true_value();
  public Value false_value();
  public Value obj_value(void* obj);
  
  public void* cptr(Value obj);
  public mrb_sym sym(Value val);
  [CCode (cname="mrb_ptr")]
  public void* class_ptr(Value kls);
  public void* obj_ptr(Value o);
  public static int fixnum(Value v);
  public static bool test(Value v);  
  public static void assert(void* a);
  [CCode (cname="RARRAY_LEN")]
  public static int RARRAY_LEN(MRb.Value a);
  public static int type(MRb.Value v);
  
EOC

[:none, :rest, :block, :any].each do |k|
  puts "\n  [CCode (cname = \"MRB_ARGS_#{k.to_s.upcase}\")]"
  puts "  public uint32 args_#{k}();"
end

[:post, :req, :opt].each do |k|
  puts "\n  [CCode (cname = \"MRB_ARGS_#{k.to_s.upcase}\")]"
  puts "  public uint32 args_#{k}(int n);"
end

puts "  [CCode (cname = \"MRB_ARGS_ARG\")]"
puts "  public uint32 args_arg(int n1, int n2);"

puts "}\n\n"

STDOUT.puts S.string.
gsub("public void* proc_new_cfunc_with_env(mrb_func foo1, int foo2,  [CCode (array_length=false)] Value[] foo3);", "public void* proc_new_cfunc_with_env(mrb_func func, [CCode (array_length_pos=1)] Value[] env);").
gsub("public Value obj_new(void* c, int argc,  [CCode (array_length=false)] Value[] argv);", "public Value obj_new(void* c, [CCode (array_length_pos=1)] Value[] argv);").
gsub(" Value load_string(", " unowned Value load_string(")
