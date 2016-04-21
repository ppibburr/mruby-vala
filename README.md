# mruby-vala
MRuby bindings to Vala (and with gobject-introspection, any language that supports it)  

Provides a .vapi file at ./vapi/mruby.vapi to bind mruby to Vala (can be re-generated from tools/gen_vapi.rb)

Provides a Shared Library exposing a more intuitive API to mruby (and to bind to other languages via GObjectIntospection)

Dependencies
===
* [girepository](http://live.gnome.org/GObjectIntrospection)

Ubuntu:  
---
Install gobject-introspection
`sudo apt-get install libgirepository1.0-dev`

Example
===
```vala
using MRuby;

void main() {
  var mrb = new Context();
  mrb.define_method(mrb.object_class, "hello", (mrb, self)=>{ return "world!";}); 
  mrb.load_string("puts hello()");
  mrb.close();
}

```

INSTALL
===
```bash
# clones and builds mruby into ./vender/mruby
# installs mruby to prefix /usr
sudo make mruby

#
# builds library, gir, typelib
make

# installs mruby-vala to prefix /usr
make install
```

alternatively `mruby-vala` .debs provided here  

* [Ubuntu 15.10 amd64](https://github.com/ppibburr/ppibburr.github.com/raw/master/mruby-vala_0.1-1_amd64.deb) 
* [Ubuntu 15.10 x86](https://github.com/ppibburr/ppibburr.github.com/raw/master/mruby-vala_0.1-1_i386.deb)



USING
===
`valac *.vala --pkg mruby-vala --pkg mruby`
