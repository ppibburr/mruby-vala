#!/usr/bin/env bash
mkdir -p vendor
cd vendor && git clone https://github.com/mruby/mruby
cd mruby && CFLAGS+=-fPIC make
sudo cp build/host/lib/libmruby.a /usr/lib/
sudo cp build/host/lib/libmruby_core.a /usr/lib/
sudo cp ../../mruby.pc /usr/lib/pkgconfig/
sudo cp -rf include/* /usr/include/
