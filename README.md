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


Setup basic file hierarchy
--------------------------

Now we need to setup the skeleton file structure in our rootfs:

    $ ./create_fhs.sh


Install linux headers
---------------------

Next we need to install the linux headers into our rootfs:

    $ sources/linux_headers.build


Compile gcc for cross compiling
-------------------------------

Now we need to compile various dependencies for gcc:

    $ ct_sources/gmp.build
    $ ct_sources/mpfr.build
    $ ct_sources/mpc.build
    $ ct_sources/binutils.build

Next we need to compile gcc (first iteration)

    $ ct_sources/gcc1.build

Then we compile uClibc (this will ask a question about EABI or OABI just choose the default EABI):

    $ ct_sources/uClibc.build

Finally we compile gcc for a final time:

    $ ct_sources/gcc2.build

At this point we have compiled gcc for your host system and enabled gcc to cross compile for your target system. Now we are ready to start compiling packages for the actual OS.

Configure cross compile env
---------------------------

First before we can compile linux we need to setup our env to use gcc and friends that we just compiled.

    $ source cross_env.sh 

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


