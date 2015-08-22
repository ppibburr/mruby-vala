namespace MRuby {
  
  public enum GetArgsType {
    STRING,
    INT,
    FLOAT,
    BOOL,
    ARRAY,
    DATA,
    OBJECT,
    HASH,
    SYMBOL,
    BLOCK,
    REST;
  }   
  
  public static void* cptr(MRuby.Value val) {
    return MRb.cptr(val.actual);
  }
  
  public static MRuby.Value nil_value() {
    return new MRuby.Value(MRb.nil_value());
  } 
  
  public static MRuby.Value true_value() {
    return new MRuby.Value(MRb.true_value());
  } 
  
  public static MRuby.Value false_value() {
    return new MRuby.Value(MRb.false_value());
  }       
  
  public static MRuby.Value bool_value(bool val) {
    return new MRuby.Value(MRb.bool_value(val)); 
  }
  
  public static MRuby.Value fixnum_value(int val) {
    return new MRuby.Value(MRb.fixnum_value(val)); 
  }  
  
  public static void* obj_ptr(MRuby.Value obj) {
    return MRb.obj_ptr(obj.actual);
  }
  
  public static void* class_ptr(MRuby.Value kls) {
    return MRb.class_ptr(kls.actual);
  }  
  
  public static int fixnum(Value v) {
    return MRb.fixnum(v.actual);
  }
  
  public static bool test(Value v) {
    return MRb.test(v.actual);
  }
  
  
  public static MRb.Value[] vary2mrb(MRuby.Value[] a) {
    MRb.Value[] o = new MRb.Value[0];
    
    for (int i=0; i < a.length; i++) {
      o+=a[i].actual;
    }
    
    return o;
  }

  public static MRuby.Value? gval2mrb(Context mrb, GLib.Value? val) {
    if (val == null) {
      return nil_value();
    }
    
    if (val.type() == typeof(MRuby.Value)) {
      var t = (MRuby.Value)val;
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
  
  public class Value : GLib.Object {
    public weak MRb.Value actual;
    public Value(MRb.Value act) {
      this.actual = act;
    }
  }
  
  public struct Symbol : MRb.mrb_sym {
    
  }

  public delegate unowned GLib.Value FuncCB(Context mrb, MRuby.Value self);

  public class MRbFuncEnv : GLib.Object {
    public FuncCB fun;
    public MRbFuncEnv(FuncCB cb) {
      this.fun = cb;
    }
  }
  
  public MRuby.Object obj_value(void* obj) {
    return new MRuby.Object(MRb.obj_value(obj));
  }  
}
