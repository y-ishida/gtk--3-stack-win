#!/bin/bash
for dir in i686-w64-mingw32 x86_64-w64-mingw32; do
	mv /usr/${dir}/lib/libpthread.dll.a{,_}
	mv /usr/${dir}/lib/libwinpthread.dll.a{,_}
	mv /usr/${dir}/lib/libwinpthread-1.dll{,_}
done

