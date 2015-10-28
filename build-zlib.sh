
echo compile zlib...

build_dir=${PWD}/build

#wget http://zlib.net/zlib-1.2.8.tar.gz
#tar xvf zlib-1.2.8.tar.gz
cd zlib-1.2.8

make clean -f win32/Makefile.gcc
make -f win32/Makefile.gcc PREFIX=i686-w64-mingw32- LOC="-static-libgcc -m32"
make install -f win32/Makefile.gcc BINARY_PATH=${build_dir}/bin INCLUDE_PATH=${build_dir}/include LIBRARY_PATH=${build_dir}/lib SHARED_MODE=1

