echo compile libffi...

build_dir=${PWD}/build

libname=gettext-0.19.6

filename=${libname}.tar.xz

url=ftp://ftp.gnu.org/pub/gnu/gettext/${filename}

if ! [ -e ${filename} ]; then
	wget ${url}
	tar xvf ${filename}
fi

cd ${libname}

./configure --host=i686-w64-mingw32 \
	--prefix=${build_dir} PKG_CONFIG_PATH= PKG_CONFIG_LIBDIR=${build_dir}/lib/pkgconfig \
	CC="i686-w64-mingw32-gcc -static-libgcc" \
	CPPFLAGS="-I${build_dir}/include" \
	LDFLAGS="-L/usr/lib/gcc/i686-w64-mingw32/4.8 -L${build_dir}/lib" \
	--disable-java \
	--disable-native-java \
	--disable-largefile \
	--disable-threads \
	--enable-relocatable \
	--disable-acl \
	--disable-openmp \
	--disable-curses \
	--without-emacs \
	--without-git

cd gettext-runtime

make clean
make
make install

