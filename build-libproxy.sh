libname=libproxy-0.4.13
filename=${libname}.tar.gz
url=https://github.com/libproxy/libproxy/archive/0.4.13.tar.gz

configure() {
	# Enables installing the .pc file for pkg-config and
	# disables WPAD and PAC.
	patch -Np1 < ../libproxy-0.4.13.patch || true

	if [ -e install ]; then
		rm -r install
	fi

	mkdir -p install
	cd install

	#	-DCMAKE_BUILD_TYPE=None

	cmake \
		-DCMAKE_INSTALL_PREFIX=${build_dir} \
		-DBIN_INSTALL_DIR=${build_dir}/bin \
		-DLIB_INSTALL_DIR=${build_dir}/lib \
		-DWITH_DOTNET=no \
		-DWITH_GNOME=no \
		-DWITH_KDE=no \
		-DWITH_MOZJS=no \
		-DWITH_NM=no \
		-DWITH_PERL=no \
		-DWITH_PYTHON=no \
		-DWITH_VALA=no \
		-DWITH_WEBKIT=no \
		-DWITH_WEBKIT3=no \
		-DCMAKE_CXX_FLAGS="${static_libgcc} ${static_pthread} ${bit32_64} -static-libstdc++ -fpermissive -O2" \
		-DCMAKE_C_FLAGS="${static_libgcc} ${static_pthread} ${bit32_64} -O2" \
		-DWIN32=TRUE \
		-DCMAKE_SYSTEM_NAME=Windows \
		-DCMAKE_C_COMPILER=i686-w64-mingw32-gcc \
		-DCMAKE_CXX_COMPILER=i686-w64-mingw32-g++ \
		-DCMAKE_RC_COMPILER=i686-w64-mingw32-windres \
		-DCMAKE_AR=/usr/bin/i686-w64-mingw32-ar \
		-DCMAKE_RANLIB=/usr/bin/i686-w64-mingw32-ranlib \
		-DCMAKE_FIND_ROOT_PATH=/usr/i686-w64-mingw32 \
		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=NEVER \
		-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=ONLY \
		-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY \
		..
}

clean() {
	:
}

build() {
	make VERBOSE=1
	make install
	mv ${build_dir}/lib/libproxy.dll ${build_dir}/bin/
}

