#! /bin/bash -ex

distdir=license

mkdir $distdir

cp --parents adwaita-icon-theme-3.16.2.2/COPYING $distdir
cp --parents atk-2.18.0/COPYING $distdir
cp --parents cairo-1.14.2/COPYING $distdir
cp --parents cairo-1.14.2/COPYING-LGPL-2.1 $distdir
cp --parents cairo-1.14.2/COPYING-MPL-1.1 $distdir
cp --parents fontconfig-2.11.1/COPYING $distdir
cp --parents gdk-pixbuf-2.32.1/COPYING $distdir
cp --parents gettext-0.19.6/gettext-runtime/intl/COPYING.LIB $distdir
cp --parents gettext-0.19.6/gettext-runtime/libasprintf/COPYING.LIB $distdir
cp --parents glib-2.46.1/COPYING $distdir
cp --parents glib-2.46.1/gmodule/COPYING $distdir
cp --parents glib-networking-2.48.2/COPYING $distdir
cp --parents gmp-6.1.0/COPYING.LESSERv3 $distdir
cp --parents gnutls-3.4.9/COPYING.LESSER $distdir
cp --parents gtk+-3.16.7/COPYING $distdir
cp --parents gtk+-3.16.7/gdk/COPYING $distdir
cp --parents hicolor-icon-theme-0.15/COPYING $distdir
cp --parents libepoxy-1.3.1/COPYING $distdir
cp --parents libgee-0.18.0/COPYING $distdir
cp --parents libiconv-1.14/COPYING.LIB $distdir
cp --parents libsoup-2.54.1/COPYING $distdir
cp --parents libxml2-2.9.2/COPYING $distdir
cp --parents pango-1.38.1/COPYING $distdir
cp --parents pixman-0.32.8/COPYING $distdir

