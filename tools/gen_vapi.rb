if MRB_INCLUDE_DIR = ENV["MRB_INCLUDE_DIR"]
elsif system "pkg-config --cflags mruby > /dev/null"
  MRB_INCLUDE_DIR = `pkg-config --cflags mruby`.strip.gsub(/^\-I/,'')
end

TYPES = {
  mrb_int:"int",
  mrb_bool:"bool",
  mrb_value:"Value",
  :"const char*"=>"string",
  void:"void",
  :"struct RClass*"=>"void*",
  :"void*"=>"void*",
  :"mrb_state*"=>"Context",
  size_t:"size_t",
  mrb_func_t:"mrb_func",
  mrb_aspec:"uint32"
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
      if fun =~ /^\*/
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

        if a =~/\*$/ or TYPES[a.strip.to_sym]
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
puts "[CCode (cprefix = \"mrb_\", cheader_filename = \"mruby.h\")]"
puts "namespace MRb {"
puts "  [CCode (has_target = false)]"
puts "  public delegate Value mrb_func(Context mrb, Value self);\n\n"
puts "  [SimpleType]"
puts "  [CCode (cname = \"mrb_value\")]"
puts "  public struct Value {}\n\n"
puts "  [Compact]"
puts "  [CCode (cprefix = \"mrb_\", cname = \"mrb_state\", free_function = \"\")]"
puts "  public class Context {"
puts "    public void* object_class;"
puts "    public int get_args(string fmt, ...);\n\n"
puts "    public Value float_value(float val);\n\n"
puts "    public Value cptr_value(void* val);\n\n"
puts "    [CCode (cname = \"mrb_open\")]"
puts "    public Context();"
METHS.each do |m|
  puts "\n    [CCode (cheader_filename = \"#{m.header}\")]"
  puts "    public #{TYPES[m.rtype]} #{m.symbol.gsub(/^mrb_/,'')}(#{m.args.map do |a| "#{TYPES[a.type]} #{a.name}" end.join(", ")});"
end
puts "  }\n\n"
puts <<-EOC
  public Value bool_value(bool val);
  public Value fixnum_value(int val);
  public Value float_value(Context mrb, float val);
  public Value nil_value();
  public Value true_value();
  public Value false_value();
  
  public void* cptr(Value obj);
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
