#!/bin/sh -e

echo compile update-icon-cache ...

build_dir=${PWD}/build

libname=gtk+-3.10.8
filename=${libname}.tar.xz
url=http://ftp.gnome.org/pub/gnome/sources/gtk+/3.10/${filename}

wrapdir=update-icon-cache

if ! [ -e ${wrapdir} ]; then
	mkdir ${wrapdir}
fi

cd ${wrapdir}

if ! [ -e ${filename} ]; then
	wget -O ${filename} ${url}
	tar xvf ${filename}
fi

cd ${libname}

CXX=/bin/false ./configure --prefix=/usr \
	--disable-schemas-compile \
	--enable-gtk2-dependency

#https://bugzilla.gnome.org/show_bug.cgi?id=655517
sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

make

