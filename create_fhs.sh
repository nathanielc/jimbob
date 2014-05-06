#!/bin/bash

# Create File Hierarchy as per http://www.pathname.com/fhs/
mkdir -pv ${JB_ROOT_FS}/{bin,boot,dev,etc,home,lib/{firmware,modules}}
mkdir -pv ${JB_ROOT_FS}/{mnt,opt,proc,sbin,srv,sys}
mkdir -pv ${JB_ROOT_FS}/var/{cache,lib,local,lock,log,opt,run,spool}
install -dv -m 0750 ${JB_ROOT_FS}/root
install -dv -m 1777 ${JB_ROOT_FS}/tmp
mkdir -pv ${JB_ROOT_FS}/usr/{,local/}{bin,include,lib,sbin,share,src}
