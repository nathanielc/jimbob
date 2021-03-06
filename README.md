JimBob OS
=========

JimBob OS - Small simplistic OS for the raspberry pi

Building
========

Overview
--------

1. Download necessary sources
2. Compile cross compile tools
3. Compile raspberry pi linux kernel
4. Compile utilities for the OS
5. Initialize root file system and install basic scripts
6. Copy file system to SD card
7. Boot jimbob OS


Download Sources
----------------

Run the download_sources.sh script to download all sources:

    $ ./download_sources.sh

A few sources are git submodules so get those as well:

    $ git submodule init 
    $ git submodule update

Setup environment
-----------------

We need to control the env so that the varios compilation tasks will not use 
information from the host system where relevant.

Source build_env.sh and host_env.sh:

    $ source build_env.sh # common env
    $ source host_env.sh # env for host as target

You will also notice a cross_env.sh script which will later be used to setup an env for cross compiling. Do not source it at this time. Sourcing host_env.sh will undo anything cross_env.sh does.

Note: If you are impatient like me you can pass a number to build_env.sh and it will setup the env to tell make to run that number of jobs simultaneously.



Install linux headers
---------------------

First we need a place to put our cross-tools headers:

    $ ./setup_ct.sh #Note this script removes the cross-tools directory and recreates it


Next we need to install the linux headers into our cross-tools dir:

    $ ct_sources/linux_headers.build


Compile gcc for cross compiling
-------------------------------

Now we need to compile binutils a dependency for gcc:

    $ ct_sources/binutils.build

Next we need to compile gcc (with libc)

    $ ct_sources/gcc1.build

Then we compile musl (small libc):

    $ ct_sources/musl.build

Finally we compile gcc for a final time:

    $ ct_sources/gcc2.build

At this point we have compiled gcc for your host system and enabled gcc to cross compile for your target system. Now we are ready to start compiling packages for the actual OS.

Configure cross compile env
---------------------------

First before we can compile linux we need to setup our env to use gcc and friends that we just compiled.

    $ source cross_env.sh

Setup basic file hierarchy
--------------------------

Now we need to setup the skeleton file structure in our rootfs:

    $ ./create_fhs.sh

Compile Busybox
---------------

The first package we will compile for the target system is busybox:

    $ sources/busybox.build

Compile iana-etc
----------------
Next we need iana-etc:

    $ sources/iana-etc.build


Compile linux
-------------

We are ready to compile linux itself:

    $ sources/linux.build


Finalize root fs
----------------

First copy over the firware into the boot directory:

    $ firmware/broadcom.build

Next copy over the bootscripts:

    $ sources/clfs-embedded-bootscripts.build


Now add several necessary config files:

    $ sources/fs.build


Setup on the network configuration specifing the desired hostname, gateway, netmask, broadcast, ip domain and namserver

    $ sources/network.build <HOSTNAME> <GATEWAY> <NETMASK> <BROADCAST> <IPADDRESS> <DOMAIN> <NAMESERVER>


Setup the fstab for booting

   $ sources/fstab.build


Create a snapshot of the root fs
--------------------------------

Lets create a snapshot of the root fs image so we can easily restore it later (optionally pass a name for the snapshot):

    $ ./snapshot [name]

Deploy the root fs
------------------

Finally we just need to copy the root fs to a SD card. To do so you will need to create two partitions on the SD card. The first partition needs to be a vfat filesystem and the second an ext5 file system. Run the deploy script which will mount the specified partitions and then copy over the root fs. Note: your user will need sudo permission to mount/umount and copy files.

    $ ./deploy.sh <boot part> <root part>


Boot
---------------

Remove the SD card and boot your pi




