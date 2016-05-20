libname=gtk+-3.16.7
filename=${libname}.tar.xz
url=http://ftp.gnome.org/pub/gnome/sources/gtk+/3.16/${filename}

configure() {
	./configure ${configure_flags} \
		--disable-dependency-tracking \
		--disable-debug \
		--disable-installed-tests \
		--disable-xkb \
		--disable-xinerama \
		--disable-xrandr \
		--disable-xfixes \
		--disable-xcomposite \
		--disable-xdamage \
		--disable-x11-backend \
		--enable-win32-backend \
		--disable-quartz-backend \
		--disable-broadway-backend \
		--disable-wayland-backend \
		--disable-mir-backend \
		--disable-quartz-relocation \
		--disable-cups \
		--disable-papi \
		--disable-cloudprint \
		--disable-test-print-backend \
		--disable-schemas-compile \
		--disable-introspection \
		--disable-colord \
		--disable-libcanberra \
		--disable-gtk-doc \
		--disable-gtk-doc-html \
		--disable-gtk-doc-pdf \
		--disable-man \
		--disable-doc-cross-references \
		--without-x \
		--with-included-immodules

#		--with-included-immodules \
#		--disable-installed-tests \
#		--enable-win32-backend
}

build() {
	make

	# fix for forced usng local 'gtk-update-icon-cache'.
	# it's no good idea, but i have no that...
	find demos -name Makefile | \
		xargs sed -i -e 's/update_icon_cache = .*update-icon-cache/update_icon_cache = gtk-update-icon-cache/'

	make install && \
	glib-compile-schemas ../build/share/glib-2.0/schemas/
}

