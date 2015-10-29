libname=gtk+-3.16.7
filename=${libname}.tar.xz
url=http://ftp.gnome.org/pub/gnome/sources/gtk+/3.16/${filename}

configure() {
	./configure ${configure_flags} \
		--with-included-immodules \
		--disable-installed-tests \
		--enable-win32-backend
}

build() {
	make

	# fix for forced usng local 'gtk-update-icon-cache'.
	# it's no good idea, but i have no that...
	find demos -name Makefile | \
		xargs sed -i -e 's/update_icon_cache = .*update-icon-cache/update_icon_cache = gtk-update-icon-cache/'

	make install
}

