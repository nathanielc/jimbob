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

Run the download_sources.sh script to download all sources

  $ ./download_sources.sh

A few sources are git submodules so get those as well

  $ git submodules init 
  $ git submodules update





