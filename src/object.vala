
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

    public MRuby.String as_string( MRuby.Context? ctx = null) {
      unowned MRuby.Context mc = get_context(ctx);


      return  mc.obj_as_string(this );
    }

    public MRuby.Object instance_variables( MRuby.Context? ctx = null) {
      unowned MRuby.Context mc = get_context(ctx);


      return  mc.obj_instance_variables(this );
    }

    public bool respond_to(MRuby.Symbol mid, MRuby.Context? ctx = null) {
      unowned MRuby.Context mc = get_context(ctx);


      return  mc.obj_respond_to(this,  mid);
    }

    public MRuby.Symbol to_sym( MRuby.Context? ctx = null) {
      unowned MRuby.Context mc = get_context(ctx);


      return  mc.obj_to_sym(this );
    }

    public bool eq(MRuby.Object foo2, MRuby.Context? ctx = null) {
      unowned MRuby.Context mc = get_context(ctx);


      return  mc.obj_eq(this,  foo2);
    }

    public bool equal(MRuby.Object foo2, MRuby.Context? ctx = null) {
      unowned MRuby.Context mc = get_context(ctx);


      return  mc.obj_equal(this,  foo2);
    }

    public string classname( MRuby.Context? ctx = null) {
      unowned MRuby.Context mc = get_context(ctx);


      return  mc.obj_classname(this );
    }

    public void* class( MRuby.Context? ctx = null) {
      unowned MRuby.Context mc = get_context(ctx);


      return  mc.obj_class(this );
    }

    public bool is_kind_of(void* c, MRuby.Context? ctx = null) {
      unowned MRuby.Context mc = get_context(ctx);


      return  mc.obj_is_kind_of(this,  c);
    }

    public MRuby.Object inspect( MRuby.Context? ctx = null) {
      unowned MRuby.Context mc = get_context(ctx);


      return  mc.obj_inspect(this );
    }

    public bool is_instance_of(void* c, MRuby.Context? ctx = null) {
      unowned MRuby.Context mc = get_context(ctx);


      return  mc.obj_is_instance_of(this,  c);
    }

  }
}

