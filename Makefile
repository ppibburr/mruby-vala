all:
	make mruby
	valac src/mruby.vala src/object.vala src/module.vala src/context.vala --vapidir=./vapi --pkg mruby --pkg gobject-introspection-1.0 -H mruby_vala.h -g -X -fPIC --library=mruby-vala --gir=MRuby-0.1.gir -o libmruby-vala.so -X -shared -X -fPIC -X -lm -X -lmruby
	make gir

gir:
	g-ir-compiler --shared-library=libmruby-vala.so --output=MRuby-0.1.typelib MRuby-0.1.gir --includedir=./

clean:
	rm *.so
	rm *.h
	rm *.vapi
	rm *.typelib
	rm MRuby-0.1.gir
	
install:
	sudo cp *.so /usr/lib/
	sudo cp *.typelib /usr/lib/girepository-1.0/
	sudo cp *.vapi /usr/share/vala/vapi/
	sudo cp vapi/*.vapi /usr/share/vala/vapi/	
	sudo cp mruby-vala.pc /usr/lib/pkgconfig/
	sudo cp *.h /usr/include/

mruby:
	./mruby.sh
