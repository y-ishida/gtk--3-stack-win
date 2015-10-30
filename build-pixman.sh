libname=pixman-0.32.8
filename=${libname}.tar.gz
url=http://www.cairographics.org/releases/${filename}

configure() {
	./configure ${configure_flags} \
		CC="${host}-gcc ${static_libgcc} ${bit32_64} -Wl,-Bstatic"

	# can't build test directory, so remove it from building target
	sed -ie 's/^SUBDIRS = .*/SUBDIRS = pixman/' Makefile
}

