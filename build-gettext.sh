libname=gettext-0.19.6
filename=${libname}.tar.xz
url=ftp://ftp.gnu.org/pub/gnu/gettext/${filename}

configure() {
	./configure ${configure_flags} \
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
}

clean() {
	cd gettext-runtime

	make clean

	cd ..
}

build() {
	cd gettext-runtime

	make
	make install

	cd ..
}

