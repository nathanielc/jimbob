#!/bin/bash

if [ -n "$1" ]
then
	NAME=$1
else
	NAME=jimbob
fi
if [ -n "$2" ]
then
	FS=$2
else
	FS=$JB_ROOT_FS
fi

if [ ! -d $JB_SNAPSHOTS ]
then
	mkdir $JB_SNAPSHOTS
fi

DIR=$(dirname $FS)
ROOT=$(basename $FS)

cd $DIR

tar czvf $JB_SNAPSHOTS/$NAME-$(date +%Y-%m-%d_%H_%M_%S).tar.gz $ROOT

