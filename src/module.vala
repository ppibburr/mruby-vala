namespace MRuby {
public class Module : Object {
    public weak void* pointer {get; construct set;}
    public unowned MRuby.Value get_value() {
      return obj_value(pointer);
    }
    
    public Module(void* pointer) {
      Object(pointer:pointer);
    }
    
    public Module.from_value(MRuby.Value value) {
      Object(pointer:class_ptr(value));
    }
    
    public Module.define(Context mrb, string name, Module? under = null) {
      void* ptr = null;
      
      if (under == null) {
        ptr = mrb.define_module(name);
      } else {
        ptr = mrb.define_module_under(under.pointer, name);
      }
      
      Object(pointer:ptr);
    }
    
    public Module.create(Context mrb) {
      Object(pointer:mrb.module_new());
    }
    
    public Module.get(Context mrb, string name) {
      Object(pointer:((MRb.Context)mrb).module_get(name));
    }
    
    public delegate unowned GLib.Value? FuncCB(Context mrb, GLib.Value? self);
    
    public void define_method(Context mrb, string name, FuncCB cb) {
      MRb.Value[] env = {mrb.cptr_value((void*)new MRbFuncEnv(cb))};
      mrb.define_method_raw(pointer, mrb.intern_cstr(name), mrb.proc_new_cfunc_with_env((mrb, self) => {
        return invoke_func_with_env((MRuby.Context)mrb, (MRuby.Value)self);
      }, env));
    }
    
    public void define_static_method(Context mrb, string name, FuncCB cb) {
      MRb.Value[] env = {mrb.cptr_value((void*)new MRbFuncEnv(cb))};
      mrb.define_method_raw(class_ptr(mrb.singleton_class(obj_value(pointer))), mrb.intern_cstr(name), mrb.proc_new_cfunc_with_env((mrb, self) => {
        return invoke_func_with_env((MRuby.Context)mrb, (MRuby.Value)self);
      }, env));      
    }
    
    public static MRuby.Value invoke_func_with_env(Context mrb, MRuby.Value self) {
      var cbi = (MRbFuncEnv)cptr(mrb.proc_cfunc_env_get(0));
      GLib.Value? v = &(self);
      var ret = gval2mrb(mrb, ((Module.FuncCB)cbi.fun)(mrb, v));      
      v = null;
      return ret;
    }    
  }

  public class Class : Module {
    public Class(void* pointer) {
      base(pointer);
    }
    
    public Class.define(Context mrb, string name, Class? super = null, Module? under = null) {
      void* ptr = null;
      void* sptr = null;
      
      if (super == null) {
        sptr = mrb.object_class;
      } else {
        sptr = super.pointer;
      }
      
      if (under == null) {
        ptr = mrb.define_class(name, sptr);
      } else {
        ptr = mrb.define_class_under(under.pointer, name, sptr);
      }
      
      Object(pointer:ptr);
    }
    
    public Class.create(Context mrb, Class? super = null) {
      void* ptr = null;
      
      if (super == null) {
        ptr = mrb.object_class;
      } else {
        ptr = super.pointer;
      }
      
      Object(pointer:mrb.class_new(ptr));
    }  
    
    public Class.get(Context mrb, string name) {
      Object(pointer:((MRb.Context)mrb).class_get(name));
    }    
  }
}
