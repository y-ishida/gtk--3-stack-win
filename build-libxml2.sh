#!/bin/sh -e

echo compile libxml2 ...

build_dir=${PWD}/build

libname=libxml2-2.9.2
filename=${libname}.tar.gz
url=ftp://xmlsoft.org/libxml2/${filename}

if ! [ -e ${filename} ]; then
	wget -O ${filename} ${url}
	tar xvf ${filename}
fi

cd ${libname}

#
# Somehow, it needs '-lz' and '-lm' option as to link library.
#

./configure --host=i686-w64-mingw32 \
	--prefix=${build_dir} PKG_CONFIG_PATH= PKG_CONFIG_LIBDIR=${build_dir}/lib/pkgconfig \
	--includedir=${build_dir}/include \
	CC="i686-w64-mingw32-gcc -static-libgcc" \
	CPPFLAGS="-I${build_dir}/include" \
	LDFLAGS="-L${build_dir}/lib" \
	LIBS="-lz -lm" \
	--with-python=no \
	--enable-shared

make clean
make
make install

