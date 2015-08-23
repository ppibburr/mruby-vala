
namespace MRuby {
  public class ArrayWithContext : MRuby.Array {
    public weak MRuby.Context mrb;
	public ArrayWithContext(MRuby.Context mrb, MRb.Value act) {
		base(act);
		this.mrb = mrb;
	}
	
	public new GLib.Value?[] to_native() {
		return ((MRuby.Array)this).to_native(mrb);
	}
	
	public new MRuby.Value @get(int i) {
	  return ((MRuby.Array)this)[mrb, i];
	}
	
	public GLib.Array<GLib.Value?> to_garray() {
	  return ((MRuby.Array)this).to_garray(mrb);
	}

    public new void concat(MRuby.Value foo2) {

       mrb.ary_concat(this,  foo2);
    }

    public new MRuby.Value splat() {

      return  mrb.ary_splat(this );
    }

    public new void push(MRuby.Value foo2) {

       mrb.ary_push(this,  foo2);
    }

    public new MRuby.Value pop() {

      return  mrb.ary_pop(this );
    }

    public new void set(int n, MRuby.Value val) {

       mrb.ary_set(this,  n, val);
    }

    public new void replace(MRuby.Value b) {

       mrb.ary_replace(this,  b);
    }

    public new MRuby.Value unshift(MRuby.Value item) {

      return  mrb.ary_unshift(this,  item);
    }

    public new MRuby.Value shift() {

      return  mrb.ary_shift(this );
    }

    public new MRuby.Value clear() {

      return  mrb.ary_clear(this );
    }

    public new MRuby.Value join(MRuby.Value sep) {

      return  mrb.ary_join(this,  sep);
    }

    public new MRuby.Value resize(int len) {

      return  mrb.ary_resize(this,  len);
    }

  }
}

