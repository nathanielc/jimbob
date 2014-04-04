#!/bin/bash

rootdir=$(dirname $0)

for src in `find $rootdir -name '*.src'`
do
	dir=$(dirname $src)
	remote=$(cat $src)
	name=$(basename $remote)
	source="$dir/$name"
	echo "checking $source"
	if [ ! -s $source ] 
	then
		wget -O $source `cat $src`
	fi
done
