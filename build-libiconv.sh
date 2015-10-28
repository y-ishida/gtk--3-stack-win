echo compile libiconv...

build_dir=${PWD}/build

libname=libiconv-1.14

filename=${libname}.tar.gz

url=http://ftp.gnu.org/pub/gnu/libiconv/${filename}

if ! [ -e ${filename} ]; then
	wget ${url}
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

