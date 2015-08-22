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
  :Context=>"Context"
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
puts "[CCode (cprefix = \"mrb_\", cheader_filename = \"mruby.h\", gir_namespace = \"MRb\", gir_version = \"0.1\")]"
puts "namespace MRb {"
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
puts "    [CCode (cname = \"mrb_open\")]"
puts "    public Context();"

C_TYPES = {
  :mrb_sym=>"MRuby.Symbol",
  :Value  =>"MRuby.Value",
  :"Value[]"=>"MRuby.Value[]",
  :"Context"=>"MRuby.Context"
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

o.puts """
namespace MRuby {
  public class Object : MRuby.Value {
    public Object(MRb.Value act) {
      base(act);
    }
    
    public Object.create(Context mrb, void* cls, MRuby.Value[] argv) {
      base(mrb.obj_new(cls, argv).actual);
    }
    
    public Object dup(Context mrb) {
      return (Object)mrb.obj_dup(this);
    }
    
    public Object clone(Context mrb) {
      return (Object)mrb.obj_clone(this);
    }    

"""


c.puts """
namespace MRuby {
  using MRb;
  public class Context : MRb.Context {
    public new void define_method(string name, FuncCB cb) {
      new Class(object_class).define_method(this, name, cb);
    }
    
    public new Class class_get(string name) {
      return new Class.get(this, name);
    }

    public new Module module_get(string name) {
      return new Module.get(this, name);
    }
    
    public new MRuby.Value float_value(float val) {
      return new MRuby.Value(((MRb.Context)this).float_value(val));
    }
    
    public new MRuby.Value cptr_value(void* val) {
      return new MRuby.Value(((MRb.Context)this).cptr_value(val));
    }    
    
    public new MRuby.Value obj_new(void* cls, MRuby.Value[] argv = {}) {
      return new MRuby.Value(((MRb.Context)this).obj_new(cls, (MRb.Value[])argv));
    }
    
    public new MRuby.Value? load_string(string str) {
      return new MRuby.Value(((MRb.Context)this).load_string(str));
    }
    
     public new GLib.Array<GLib.Value?> get_args(GetArgsType[] types, int optional_at = -1, out bool[] passed_optionals = null) {
      int a;
      unowned MRb.Value[]? b;

      int n = ((MRb.Context)this).get_args(\"*\", out b, out a);
      
      var ary = new GLib.Array<GLib.Value?>();
      
      for (int i=0; i < types.length; i++) {
        GLib.Value? v;
        switch (types[i]) {
        case GetArgsType.INT:
          v = MRb.fixnum(((MRb.Context)this).Integer(b[i]));
          ary.append_val(v);
          break;
          
        case GetArgsType.FLOAT:
          v = ((MRb.Context)this).to_flo(b[i]);
          ary.append_val(v);
          break;           
          
        case GetArgsType.BOOL:
          v = MRb.test(b[i]);
          ary.append_val(v);
          break;
          
        case GetArgsType.STRING:
          v = (string)((MRb.Context)this).str_to_cstr(b[i]);
          ary.append_val(v);
          break;          
                    
        default:
          return ary;
        }
      }
      
      return ary;
    }
       
"""

METHS.each do |m|
  puts "\n    [CCode (cheader_filename = \"#{m.header}\")]"
  puts "    public #{TYPES[m.rtype]} #{m.symbol.gsub(/^mrb_/,'')}(#{m.args.map do |a| "#{t=TYPES[a.type]; t == "Value[]" ? " [CCode (array_length=false)] "+t : t} #{a.name.gsub(/^base$/, "_base")}" end.join(", ")});"
  if !EXC.index(m.symbol.gsub(/^mrb_/,'').to_sym)
    c.puts "    public new #{rt=C_TYPES[TYPES[m.rtype].to_sym] || TYPES[m.rtype]} #{s=m.symbol.gsub(/^mrb_/,'')}(#{m.args.map do |a| "#{C_TYPES[TYPES[a.type].to_sym] || TYPES[a.type]} #{a.name.gsub(/^base$/, "_base")}" end.join(", ")}) {"
    c.puts "\n      #{rt.to_s == "void" ? "" : "return "} #{C_TYPES[TYPES[m.rtype].to_sym] ? ( (z = rt == "MRuby.Value") ? "new MRuby.Value(" : "(#{rt})") : ""}((MRb.Context)this).#{s}(#{m.args.map do |a| q = C_TYPES[TYPES[a.type].to_sym] || TYPES[a.type]; ((s = q == "MRuby.Value[]") ? "MRuby.vary2mrb(" : "") + a.name.gsub(/^base$/, "_base") + (s ? ")" : "#{q == "MRuby.Value" ? ".actual" : ""}") end.join(", ")})#{z ? ")" : ""};\n"
    c.puts("    }\n\n")
  end
end

METHS.find_all do |m| m.symbol.to_s =~ /^mrb_obj_/ end.each do |m|
  if !OEXC.index(m.symbol.gsub(/^mrb_obj_/,'').to_sym)
    margs = m.args.clone
    margs.shift
    margs.unshift a = Arg.new
    a.name = "mrb"
    a.type = :"Context"
    o.puts "    public #{rt=C_TYPES[TYPES[m.rtype].to_sym] || TYPES[m.rtype]} #{s=m.symbol.gsub(/^mrb_obj_/,'')}(#{margs.map do |a| "#{C_TYPES[TYPES[a.type].to_sym] || TYPES[a.type]} #{a.name.gsub(/^base$/, "_base")}" end.join(", ")}) {"
    o.puts "\n      #{rt.to_s == "void" ? "" : "return "} mrb.obj_#{s}(this#{margs.length > 1 ? ", " :""} #{margs.map do |a| q = C_TYPES[TYPES[a.type].to_sym] || TYPES[a.type]; ((s = q == "MRuby.Value[]") ? "MRuby.vary2mrb(" : "") + a.name.gsub(/^base$/, "_base") + (s ? ")" : "") end[1..-1].join(", ")});\n"
    o.puts("    }\n\n")
  end
end

c.puts "  }\n}\n\n"
c.close

o.puts "  }\n}\n\n"
o.close
puts "  }\n\n"
puts <<-EOC
  public Value bool_value(bool val);
  public Value fixnum_value(int val);
  public Value float_value(Context mrb, float val);
  public Value nil_value();
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
