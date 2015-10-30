libname=fontconfig-2.11.1
filename=${libname}.tar.bz2
url=http://www.freedesktop.org/software/fontconfig/release/${filename}

configure() {
	./configure ${configure_flags} --disable-docs --enable-libxml2
}

