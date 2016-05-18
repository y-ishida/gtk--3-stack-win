libname=libsoup-2.54.1
filename=${libname}.tar.xz
url=http://ftp.gnome.org/pub/GNOME/sources/libsoup/2.54/${filename}

configure() {
	./configure ${configure_flags} \
		--enable-tls-check \
		--disable-more-warnings \
		--disable-always-build-tests
}

