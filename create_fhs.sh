#!/bin/bash

# Create File Hierarchy as per http://www.pathname.com/fhs/
mkdir -pv ${JB_ROOT_FS}/{bin,boot,dev,{etc/,}opt,home,lib/{firmware,modules},mnt}
mkdir -pv ${JB_ROOT_FS}/{proc,media/{floppy,cdrom},sbin,srv,sys}
mkdir -pv ${JB_ROOT_FS}/var/{lock,log,mail,run,spool}
mkdir -pv ${JB_ROOT_FS}/var/{opt,cache,lib/{misc,locate},local}
install -dv -m 0750 ${JB_ROOT_FS}/root
install -dv -m 1777 ${JB_ROOT_FS}{/var,}/tmp
mkdir -pv ${JB_ROOT_FS}/usr/{,local/}{bin,include,lib,sbin,src}
mkdir -pv ${JB_ROOT_FS}/usr/{,local/}share/{doc,info,locale,man}
mkdir -pv ${JB_ROOT_FS}/usr/{,local/}share/{misc,terminfo,zoneinfo}
mkdir -pv ${JB_ROOT_FS}/usr/{,local/}share/man/man{1,2,3,4,5,6,7,8}
for dir in ${JB_ROOT_FS}/usr{,/local}; do
  ln -sv share/{man,doc,info} ${dir}
done
