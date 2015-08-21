namespace MRuby {
  public static void* cptr(MRuby.Value val) {
    return MRb.cptr(val);
  }
  
  public static MRuby.Value nil_value() {
    return (MRuby.Value)MRb.nil_value();
  } 
  
  public static MRuby.Value true_value() {
    return (MRuby.Value)MRb.true_value();
  } 
  
  public static MRuby.Value false_value() {
    return (MRuby.Value)MRb.false_value();
  }       
  
  public static MRuby.Value bool_value(bool val) {
    return (MRuby.Value)MRb.bool_value(val); 
  }
  
  public static MRuby.Value fixnum_value(int val) {
    return (MRuby.Value)MRb.fixnum_value(val); 
  }  
  
  public static MRuby.Value obj_value(void* obj) {
    return (MRuby.Value)MRb.obj_value(obj);
  }
  
  public static void* obj_ptr(MRuby.Value obj) {
    return MRb.obj_ptr(obj);
  }
  
  public static void* class_ptr(MRuby.Value kls) {
    return MRb.class_ptr(kls);
  }  

  public static MRuby.Value? gval2mrb(Context mrb, owned GLib.Value? val) {
    if (val == null) {
      return nil_value();
    }
    
    if (val.type() == typeof(void*)) {
      var t = (MRuby.Value?)(void*)val;
      return t;
      
    } else if (val.type() == typeof(int)) {
      return fixnum_value((int)val);
   
    } else if (val.type() == typeof(float)) {
      return mrb.float_value((float)val);
  
    } else if (val.type() == typeof(double)){  
      return mrb.float_value((float)(double)val);  
    
    } else if (val.type() == typeof(bool)){  
      return bool_value((bool)val);      
       
    } else if (val.type() == typeof(string)) {
      
      return mrb.str_new_cstr((string)val);
      
    } else {
      print("%s not converted.\n", val.type().name());
      return nil_value();
    }
  }
  
  public struct Value : MRb.Value {
    
  }
  
  public struct Symbol : MRb.mrb_sym {
    
  }

  public class MRbFuncEnv : Object {
    public void* fun;
    public MRbFuncEnv(Module.FuncCB cb) {
      this.fun = (void*)cb;
    }
  }
}
