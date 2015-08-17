# mruby-vala
MRuby bindings to Vala (and with gobject-introspection, any language that supports it)  

Provides a .vapi file at ./vapi/mruby.vapi to bind mruby to Vala (can be re-generated from tools/gen_vapi.rb)

Will provide a Shared Library to bind to other languages via GObjectIntospection

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
