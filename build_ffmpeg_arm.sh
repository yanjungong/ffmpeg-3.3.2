#!/bin/bash
NDK=/home/gyj/data/ffmpeg/android-ndk-r9d
SYSROOT=$NDK/platforms/android-14/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.8/prebuilt/linux-x86_64

CPU=arm
PREFIX=$(pwd)/android/$CPU
ADDI_CFLAGS=""
ADDI_LDFLAGS=""

function build_arm
{

./configure \
--prefix=$PREFIX \
--enable-small \
--enable-static \
--enable-protocol=file \
--enable-protocol=http \
--disable-decoders \
--enable-decoder=h264 \
--enable-decoder=mpeg4 \
--enable-decoder=aac \
--enable-decoder=eac3 \
--enable-decoder=hevc \
--disable-encoders \
--enable-encoder=h264 \
--enable-encoder=mpeg4 \
--enable-encoder=aac \
--enable-encoder=eac3 \
--disable-demuxers \
--enable-demuxer=flv \
--enable-demuxer=mpegts \
--enable-demuxer=mpegtsraw \
--enable-demuxer=mpegvideo \
--enable-demuxer=mov \
--enable-demuxer=hevc \
--disable-muxers \
--enable-muxer=flv \
--enable-muxer=mpegts \
--enable-muxer=mpegtsraw \
--enable-muxer=mpegvideo \
--enable-muxer=mov \
--disable-parser=dnxhd \
--disable-ffprobe \
--disable-ffserver \
--disable-avdevice \
--disable-filters \
--disable-doc \
--disable-symver \
--cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
--target-os=linux \
--arch=arm \
--enable-cross-compile \
--sysroot=$SYSROOT \
--extra-cflags="-Os -fpic $ADDI_CFLAGS" \
--extra-ldflags="$ADDI_LDFLAGS" \
$ADDITIONAL_CONFIGURE_FLAG
make
make install
}

build_arm

# optional
# --disable-avdevice
# --disable-everything(custom component options,such as encoder\decoder...)
# --enable-decoder=h264
# --enable-decoder=aac
