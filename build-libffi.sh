echo compile libffi...

. ./common.sh

build_dir=${PWD}/build

libname=libffi-3.2.1

filename=${libname}.tar.gz

if ! [ -e ${filename} ]; then
	wget ftp://sourceware.org/pub/libffi/${filename}
	tar xvf ${filename}
fi

cd ${libname}

./configure --host=i686-w64-mingw32 \
	--prefix=${build_dir} PKG_CONFIG_PATH= PKG_CONFIG_LIBDIR=${build_dir}/lib/pkgconfig \
	CC="i686-w64-mingw32-gcc -static-libgcc" \
	CPPFLAGS="-I${build_dir}/include" \
	LDFLAGS="-L${build_dir}/lib" \
	--enable-shared

make clean
make
make install

