# mruby-vala
MRuby bindings to Vala (and with gobject-introspection, any language that supports it)  

Provides a .vapi file at ./vapi/mruby.vapi to bind mruby to Vala (can be re-generated from tools/gen_vapi.rb)

Provides a Shared Library exposing a more intuitive API to mruby (and to bind to other languages via GObjectIntospection)

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

INSTALL
===
```bash
# clones and builds mruby into ./vender/mruby
# installs mruby to prefix /usr
# any mruby will work as long as compiled with -fPIC
#
# builds library, gir, typelib
make

# installs mruby-vala to prefix /usr
make install
```

USING
===
`valac *.vala --pkg mruby-vala --pkg mruby`
