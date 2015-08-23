
namespace MRuby {
  public class Array : MRuby.Value {
    public Array(MRb.Value act) {
      base(act);
    }
  
    public Array.create(MRuby.Context mrb) {
      base(((MRb.Context)mrb).ary_new());
    }
    
    public Array.from_values(MRuby.Context mrb, MRuby.Value[] vals) {
      base(((MRb.Context)mrb).ary_new_from_values(vals.length, MRuby.vary2mrb(vals)));
    }
    
    public Array.from_gvalues(MRuby.Context mrb, GLib.Value?[] vals) {
      MRuby.Value[] m = new MRuby.Value[0];
      foreach(var v in vals) {
        m += gval2mrb(mrb, v);
      }
      from_values(mrb, m);
    }
    
    public Array.from_garray(MRuby.Context mrb, GLib.Array<GLib.Value?> g) {
      MRuby.Value[] m = new MRuby.Value[0];    
      for (int i=0; i < g.length; i++) {
        m += gval2mrb(mrb, g.index(i));
      }
      from_values(mrb, m);
    }
    
    public MRuby.Value get(MRuby.Context mrb, int idx) {
      return mrb.ary_ref(this, idx);
    }
    
    public int length {
      get {
        return MRb.RARRAY_LEN(this.actual);
      }
    }
    
    public GLib.Array<GLib.Value?> to_garray(MRuby.Context mrb) {
      GLib.Array<GLib.Value?> o = new GLib.Array<GLib.Value?>();
      for (int i=0; i < length; i++) {
        o.append_val(this[mrb, i]);
      }
      
      return o;
    }
    
    public GLib.Value?[] to_native(MRuby.Context mrb) {
      GLib.Value?[] n = new GLib.Value?[0];
      
      for (int i=0; i < length; i++) {
        n += mrb2gval(mrb, this[mrb, i]);
      }
      
      return n;
    }
    
    public void concat(MRuby.Context mrb, MRuby.Value foo2) {

       mrb.ary_concat(this,  foo2);
    }

    public MRuby.Value splat(MRuby.Context mrb) {

      return  mrb.ary_splat(this );
    }

    public void push(MRuby.Context mrb, MRuby.Value foo2) {

       mrb.ary_push(this,  foo2);
    }

    public MRuby.Value pop(MRuby.Context mrb) {

      return  mrb.ary_pop(this );
    }

    public void set(MRuby.Context mrb, int n, MRuby.Value val) {

       mrb.ary_set(this,  n, val);
    }

    public void replace(MRuby.Context mrb, MRuby.Value b) {

       mrb.ary_replace(this,  b);
    }

    public MRuby.Value unshift(MRuby.Context mrb, MRuby.Value item) {

      return  mrb.ary_unshift(this,  item);
    }

    public MRuby.Value shift(MRuby.Context mrb) {

      return  mrb.ary_shift(this );
    }

    public MRuby.Value clear(MRuby.Context mrb) {

      return  mrb.ary_clear(this );
    }

    public MRuby.Value join(MRuby.Context mrb, MRuby.Value sep) {

      return  mrb.ary_join(this,  sep);
    }

    public MRuby.Value resize(MRuby.Context mrb, int len) {

      return  mrb.ary_resize(this,  len);
    }

  }
}

