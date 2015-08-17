# mruby-vala
MRuby bindings to Vala (and with gobject-introspection, any language that supports it)

Example
===
```vala
using MRb;

void main() {
  var mrb = new Context();
  mrb.define_method(mrb.object_class, "hello", (mrb)=>{ return mrb.str_new("world!", 6);}, args_none()); 
  mrb.load_string("puts hello()");
  mrb.close();
}

```
