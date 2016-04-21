#!/usr/bin/env bash
mkdir -p vendor
rm -rf vendor
mkdir -p vendor 
cd vendor && git clone https://github.com/ppibburr/mruby-shared.git
cd mruby-shared
cp ../../build_config.rb ./
CFLAGS+=-fPIC make
 
cp libmruby.so /usr/lib/libmruby-shared.so
cp ../../mruby.pc /usr/lib/pkgconfig/
mkdir -p /usr/include/mruby-shared
cp -rf include/* /usr/include/mruby-shared
