#!/bin/bash

NDK=/home/shoh/Android/Sdk/ndk-bundle
PLATFORM=$NDK/platforms/android-21/arch-arm64/
PREBUILT=$NDK/toolchains/aarch64-linux-android-4.9/prebuilt
PREFIX=$NDK/sources/ffmpeg-3.2.4/libx264

function build_one
{
  ./configure \
    --cross-prefix=$PREBUILT/linux-x86_64/bin/aarch64-linux-android- \
    --sysroot=$PLATFORM \
    --host=aarch64-linux \
    --enable-pic \
    --enable-static \
    --extra-cflags="-fPIE -pie" \
    --extra-ldflags="-fPIE -pie" \
    --disable-cli \
    --prefix=$PREFIX \
    --bindir=$PREFIX/bin
	make clean
	make
	make install
}
build_one
