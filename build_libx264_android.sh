#!/bin/bash

NDK=/home/shoh/Android/Sdk/ndk-bundle
PLATFORM=$NDK/platforms/android-9/arch-arm/
PREBUILT=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt
PREFIX=$NDK/sources/ffmpeg-3.2.4/libx264

./configure --cross-prefix=$PREBUILT/linux-x86_64/bin/arm-linux-androideabi- \
--sysroot=$PLATFORM \
--host=arm-linux \
--enable-pic \
--enable-static \
--extra-cflags="-fPIE -pie" \
--extra-ldflags="-fPIE -pie" \
--disable-cli \
--disable-asm \
--prefix=$PREFIX \
--bin-dir=$PREFIX/bin
