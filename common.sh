
build_dir=${PWD}/build

configure_flags= \
	--host=i686-w64-mingw32 \
	--prefix=${build_dir} PKG_CONFIG_PATH= PKG_CONFIG_LIBDIR=${build_dir}/lib/pkgconfig \
	--includedir=${build_dir}/include \
	CC="i686-w64-mingw32-gcc -static-libgcc -Wl,-Bstatic -lpthread -Wl,-Bdynamic" \
	CPPFLAGS="-I${build_dir}/include" \
	LDFLAGS="-L${build_dir}/lib" \
	--enable-shared

