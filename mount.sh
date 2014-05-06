#!/bin/bash

JB_BOOT_PART=$1
JB_ROOT_PART=$2

sudo umount $JB_BOOT_PART
sudo umount $JB_ROOT_PART

if [ ! -d $JB_MNT_FS ]
then
	mkdir $JB_MNT_FS
else
	sudo umount $JB_MNT_FS/boot
	sudo umount $JB_MNT_FS
fi

sudo -E mount $JB_ROOT_PART -t ext4 $JB_MNT_FS
if [ $? -ne 0 ]
then
	echo 'Failed to mount root partition'
	exit 1
fi

if [ ! -d $JB_MNT_FS/boot ]
then
	sudo mkdir $JB_MNT_FS/boot
fi

sudo -E mount $JB_BOOT_PART -t vfat $JB_MNT_FS/boot
if [ $? -ne 0 ]
then
	echo 'Failed to mount boot partition'
	exit 2
fi

