namespace MRuby {  
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
  
  public static TT type(Value v) {
    return (TT)(MRb.type(v.actual) - 1);
  }
  
  public static void* nil_p(Value v) {
    return MRb.nil_p(v.actual); 
  }
  
  public static MRuby.Value[] mrb2vary(MRb.Value[] m, int? a = null) {
    int len = a ?? m.length;
    
    MRuby.Value[] ary = new MRuby.Value[0];
    
    for (int i=0; i < len; i++) {
      ary += new MRuby.Value(m[i]);
    }
    
    return ary;
  }
  
  public static MRb.Value[] vary2mrb(MRuby.Value[] a) {
    MRb.Value[] o = new MRb.Value[0];
    
    for (int i=0; i < a.length; i++) {
      o+=a[i].actual;
    }
    
    return o;
  }
  
	public enum TT {
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
  
  public static GLib.Value? mrb2gval(Context mrb, MRuby.Value m) {
	  print(@"$(type(m)+1)\n");
	  switch (type(m)+1) {
	  case TT.STRING:
      return (string)mrb.str_to_cstr(m);
	  case TT.FIXNUM:
      return fixnum(m);
	  case TT.FLOAT:
      return mrb.to_flo(m);
	  case TT.TRUE:
      return true;
    case TT.FALSE:
      if (nil_p(m) != null) {
        return false;
      }
      
      return null;
      
    case TT.OBJECT:
      print("OBJECT\n");
      return (MRuby.Object)m;
    case TT.ARRAY:
      return (MRuby.Array)m; 
	  default:
      return m;
	  }
  }

  public static MRuby.Value? gval2mrb(Context mrb, GLib.Value? val) {
    if (val == null) {
      return nil_value();
    }
    
    if (val.type().is_object()) {
	  if ((GLib.Object)val is MRuby.Value) {
        var t = (MRuby.Value)val;
        return t;
  	  } else {
		// TODO:
		return MRuby.nil_value();  
	  }
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
    public weak MRuby.Context mrb;
    public Value(MRb.Value act, MRuby.Context? mrb = null) {
      this.actual = act;
      if (mrb != null) {
        this.mrb = mrb;
	  }
    }
   
    public string to_string(MRuby.Context? c = null) {
		unowned MRuby.Context mc = get_context(c);
		return (string)mc.str_to_cstr(mc.obj_as_string(this)); 
	}
   
    public unowned MRuby.Context? get_context(MRuby.Context? c) {
      unowned MRuby.Context mc;
      if (c != null) {
		mc = c;
      } else {
        mc = mrb;
      }
      
      return mc;		
	}
  }
  
  public struct Symbol : MRb.mrb_sym {
    
  }

  public delegate unowned GLib.Value? FuncCB(Context mrb, MRuby.Value self);

  public class MRbFuncEnv : GLib.Object {
    public FuncCB fun;
    public MRbFuncEnv(FuncCB cb) {
      this.fun = cb;
    }
  }
  
  public MRuby.Object obj_value(void* obj) {
    return new MRuby.Object.from(MRb.obj_value(obj));
  }  
}
