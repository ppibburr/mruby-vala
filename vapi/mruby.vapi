[CCode (cheader_filename = "mruby.h", cprefix="mrb_")]
namespace MRb {
  [Compact] 
  [CCode (cname = "mrb_state", cprefix = "mrb_", free_function="")]
  public class Context {
    [CCode (cname = "mrb_open")]
    public Context();
    public void close();
    public void load_string(string code);
    [CCode (instance_pos= 0)]
    public void run();
    public void* object_class;
    [CCode (has_target=false)]
    public delegate Value mrb_func(Context self, Value obj);
    public void define_method(void* cls, string name, mrb_func func, uint32 aspec);
    public Value str_new(string str, size_t len);
  }
  
  [SimpleType]
  [CCode (cname = "mrb_value")]
  public struct Value {
  }
  
  [CCode (cname="MRB_ARGS_NONE")]
  public static uint32 args_none();
  public static weak Value nil_value();  
  public static unowned Value bool_value(bool val);
  public static unowned Value fixnum_value(int val);
}
