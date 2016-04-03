libname=cairo-1.14.2
filename=${libname}.tar.xz
url=http://www.cairographics.org/releases/${filename}

configure() {
	./configure ${configure_flags} \
		--disable-xlib \
		--disable-xlib-xrender \
		--disable-xcb \
		--disable-xlib-xcb \
		--disable-xcb-shm \
		CFLAGS="-Wno-error=implicit-function-declaration"
}
