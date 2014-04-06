#!/bin/bash

snapshot=$1
name=$(basename $snapshot)

if [ -f $snapshot ]
then
	dir=`mktemp -d`
	echo "Using tmp dir $dir"
	cp $snapshot $dir/
	cd $dir
	tar xf $name
	ret=$?
	if [ $ret -ne 0 ]
	then
		echo 'Failed to extract snapshot'
		rm -rf $dir
		exit 2
	fi
	if [ -d $dir/rootfs ]
	then
		rm -rf $JB_ROOT_FS
		mv $dir/rootfs $JB_ROOT_FS
		ret=$?
		if [ $ret -ne 0 ]
		then
			echo 'Failed to mv rootfs dir'
			echo "Look for the rootfs here: $dir"
			exit 3
		fi
		rm -rf $dir
		echo 'Successfully restored the snapshot'
	else
		echo "'rootfs' dir not found in snapshot"
		echo "Look for the rootfs here: $dir"
		exit 4
	fi
else
	echo "$1 not found"
	exit 5
fi

