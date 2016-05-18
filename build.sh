#!/bin/sh -e

build_dir=${PWD}/build
work_dir=${PWD}

host=i686-w64-mingw32

static_libgcc=-static-libgcc

static_pthread="-Wl,-Bstatic -lpthread -Wl,-Bdynamic"

# -m32 or -m64
bit32_64=-m32

configure_flags=" \
	--host=${host} \
	--prefix=${build_dir}  \
	--includedir=${build_dir}/include \
	--enable-shared"

export PKG_CONFIG_PATH
PKG_CONFIG_PATH=

export PKG_CONFIG_LIBDIR
PKG_CONFIG_LIBDIR=${build_dir}/lib/pkgconfig

export CC
CC="${host}-gcc ${static_libgcc} ${static_pthread} ${bit32_64}"

export CPPFLAGS
CPPFLAGS="-I${build_dir}/include"

export LDFLAGS
LDFLAGS="-L${build_dir}/lib"

build_list="
	./build-zlib.sh
	./build-libffi.sh
	./build-libiconv.sh
	./build-gettext.sh
	./build-glib.sh
	./build-atk.sh
	./build-libpng.sh
	./build-gdk-pixbuf.sh
	./build-libxml2.sh
	./build-freetype2.sh
	./build-fontconfig.sh
	./build-pixman.sh
	./build-cairo.sh
	./build-pango.sh
	./build-libepoxy.sh
	./build-hicolor-icon-theme.sh
	./build-adwaita-icon-theme.sh
	./build-gtk.sh
	./build-libsoup.sh
	./build-gee.sh
"


glib_networking_depends="
	./build-gmp.sh
	./build-nettle.sh
	./build-gnutls.sh
"

libsoup_depends="
	./build-glib-networking.sh
	./build-sqlite3.sh
"

# for testing
build_list="
	./build-libsoup.sh
"

libname=
filename=
url=

for target in ${build_list}; do
	cd ${work_dir}

	#------------------------
	# declare default functions
	configure() {
		./configure ${configure_flags}
	}

	clean() {
		make clean
	}

	build() {
		make
		make install
	}
	#------------------------

	# import variables and override functions for build
	. ${target}

	if ! [ -e ${filename} ]; then
		wget -O ${filename} ${url}
		tar xvf ${filename}
	fi

	cd ${libname}

	configure
	clean
	build
done

find ${build_dir}/bin -name '*.dll' -exec strip -s {} \;
find ${build_dir}/bin -name '*.exe' -exec strip -s {} \;

