#!/bin/bash

export CXXFLAGS="-fPIC -fvisibility=hidden"
./configure --disable-shared --prefix=`pwd`/build
make -j3 && make install
