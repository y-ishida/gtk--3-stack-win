libname=zlib-1.2.8
filename=${libname}.tar.gz
url=http://zlib.net/${filename}

configure() {
	:
}

clean() {
	make clean -f win32/Makefile.gcc
}

build() {
	make -f win32/Makefile.gcc PREFIX=${host}- LOC="${static_libgcc} ${bit32_64}"
	make install -f win32/Makefile.gcc BINARY_PATH=${build_dir}/bin INCLUDE_PATH=${build_dir}/include LIBRARY_PATH=${build_dir}/lib SHARED_MODE=1
}

