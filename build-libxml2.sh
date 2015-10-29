libname=libxml2-2.9.2
filename=${libname}.tar.gz
url=ftp://xmlsoft.org/libxml2/${filename}

configure() {
	# Somehow, it needs '-lz' and '-lm' option as to link library.
	./configure ${configure_flags} \
		LIBS="-lz -lm" \
		--with-python=no
}

