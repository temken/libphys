#!/bin/bash
for filename in `find . -type f -name '*.cpp'`; 
do 
	echo $filename
	obj=$(echo $filename | sed -e s/src/build/ -e s/cpp/o/)
	echo $obj
	gcov -p -o $obj $filename
done