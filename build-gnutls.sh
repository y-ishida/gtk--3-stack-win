libname=gnutls-3.4.9
filename=${libname}.tar.xz
url=ftp://ftp.gnutls.org/gcrypt/gnutls/v3.4/${filename}

configure() {
	./configure ${configure_flags} \
		--with-included-libtasn1 \
		--without-p11-kit \
		--without-libpthread-prefix \
		--disable-doc \
		--disable-tools \
		--disable-cxx \
		--disable-tests \
		--enable-local-libopts
}

