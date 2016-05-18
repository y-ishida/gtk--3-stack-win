libname=gmp-6.1.0
filename=${libname}.tar.xz
url=https://gmplib.org/download/gmp/${filename}

configure() {
	./configure ${configure_flags} \
		--disable-static \
		--enable-shared
}

