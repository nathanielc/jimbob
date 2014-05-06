#!/bin/bash

JB_BOOT_PART=$1
JB_ROOT_PART=$2

sudo umount $JB_BOOT_PART
sudo umount $JB_ROOT_PART

