libname=pixman-0.32.8
filename=${libname}.tar.gz
url=http://www.cairographics.org/releases/${filename}

configure() {
	./configure ${configure_flags} \
		CC="${host}-gcc ${static_libgcc} ${bit32_64} -Wl,-Bstatic"
}

clean() {
	cd pixman

	make clean

	cd ..
}

build() {
	cd pixman

	make
	make install

	cd ..
}

