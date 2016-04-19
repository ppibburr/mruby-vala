#!/usr/bin/env bash
mkdir -p vendor
cd vendor && git clone https://github.com/ppibburr/mruby-shared.git
cd mruby-shared
make clean
CFLAGS+=-fPIC make
sudo cp libmruby.so /usr/lib/libmruby-shared.so
sudo cp ../../mruby.pc /usr/lib/pkgconfig/
sudo mkdir -p /usr/include/mruby-shared
sudo cp -rf include/* /usr/include/mruby-shared
