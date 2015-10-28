#!/bin/sh -e

echo compile fontconfig ...

build_dir=${PWD}/build

libname=fontconfig-2.11.1
filename=${libname}.tar.bz2
url=http://www.freedesktop.org/software/fontconfig/release/${filename}


if ! [ -e ${filename} ]; then
	wget -O ${filename} ${url}
	tar xvf ${filename}
fi

cd ${libname}

./configure --host=i686-w64-mingw32 \
	--prefix=${build_dir} PKG_CONFIG_PATH= PKG_CONFIG_LIBDIR=${build_dir}/lib/pkgconfig \
	--includedir=${build_dir}/include \
	CC="i686-w64-mingw32-gcc -static-libgcc" \
	CPPFLAGS="-I${build_dir}/include" \
	LDFLAGS="-L${build_dir}/lib" \
	--enable-shared \
	--enable-libxml2

make clean
make
make install

