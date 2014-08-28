#!/bin/sh

NDK_ROOT=/tmp/my-android-toolchain
CROSS_COMPILE=$NDK_ROOT/bin/arm-linux-androideabi-
export SYS_ROOT="$NDK_ROOT/sysroot"
export CC="$CROSS_COMPILE"gcc
export CXX="$CROSS_COMPILE"g++
export LD="$CROSS_COMPILE"ld
export AR="$CROSS_COMPILE"ar
export RANLIB="$CROSS_COMPILE"ranlib
export STRIP="$CROSS_COMPILE"strip

export CXXFLAGS="-fPIC -fvisibility=hidden"
./configure --disable-shared --host=arm-eabi --prefix=`pwd`/build --with-protoc=protoc
make -j3 && make install
