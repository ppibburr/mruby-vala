
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

    public MRuby.Value as_string(MRuby.Context mrb) {

      return  mrb.obj_as_string(this );
    }

    public MRuby.Value instance_variables(MRuby.Context mrb) {

      return  mrb.obj_instance_variables(this );
    }

    public bool respond_to(MRuby.Context mrb, MRuby.Symbol mid) {

      return  mrb.obj_respond_to(this,  mid);
    }

    public MRuby.Symbol to_sym(MRuby.Context mrb) {

      return  mrb.obj_to_sym(this );
    }

    public bool eq(MRuby.Context mrb, MRuby.Value foo2) {

      return  mrb.obj_eq(this,  foo2);
    }

    public bool equal(MRuby.Context mrb, MRuby.Value foo2) {

      return  mrb.obj_equal(this,  foo2);
    }

    public string classname(MRuby.Context mrb) {

      return  mrb.obj_classname(this );
    }

    public void* class(MRuby.Context mrb) {

      return  mrb.obj_class(this );
    }

    public bool is_kind_of(MRuby.Context mrb, void* c) {

      return  mrb.obj_is_kind_of(this,  c);
    }

    public MRuby.Value inspect(MRuby.Context mrb) {

      return  mrb.obj_inspect(this );
    }

    public bool is_instance_of(MRuby.Context mrb, void* c) {

      return  mrb.obj_is_instance_of(this,  c);
    }

  }
}

