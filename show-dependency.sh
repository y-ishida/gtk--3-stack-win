#!/bin/sh -e

dll_files=`find build/bin -name '*.dll'`

for f in $dll_files; do
	echo $f
	objdump -p $f | grep 'DLL Name' | sed -e 's/DLL Name://'
done

