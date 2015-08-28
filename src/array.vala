
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
    public void concat(MRuby.Object foo2, MRuby.Context? ctx = null) {
      unowned MRuby.Context mc = get_context(ctx);


       mc.ary_concat(this,  foo2);
    }

    public MRuby.Object splat( MRuby.Context? ctx = null) {
      unowned MRuby.Context mc = get_context(ctx);


      return  mc.ary_splat(this );
    }

    public void push(MRuby.Object foo2, MRuby.Context? ctx = null) {
      unowned MRuby.Context mc = get_context(ctx);


       mc.ary_push(this,  foo2);
    }

    public MRuby.Object pop( MRuby.Context? ctx = null) {
      unowned MRuby.Context mc = get_context(ctx);


      return  mc.ary_pop(this );
    }

    public void replace(MRuby.Object b, MRuby.Context? ctx = null) {
      unowned MRuby.Context mc = get_context(ctx);


       mc.ary_replace(this,  b);
    }

    public MRuby.Object unshift(MRuby.Object item, MRuby.Context? ctx = null) {
      unowned MRuby.Context mc = get_context(ctx);


      return  mc.ary_unshift(this,  item);
    }

    public MRuby.Object shift( MRuby.Context? ctx = null) {
      unowned MRuby.Context mc = get_context(ctx);


      return  mc.ary_shift(this );
    }

    public MRuby.Object clear( MRuby.Context? ctx = null) {
      unowned MRuby.Context mc = get_context(ctx);


      return  mc.ary_clear(this );
    }

    public MRuby.Object join(MRuby.Object sep, MRuby.Context? ctx = null) {
      unowned MRuby.Context mc = get_context(ctx);


      return  mc.ary_join(this,  sep);
    }

    public MRuby.Object resize(int len, MRuby.Context? ctx = null) {
      unowned MRuby.Context mc = get_context(ctx);


      return  mc.ary_resize(this,  len);
    }

  }
}

