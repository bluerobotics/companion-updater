#!/usr/bin/env bash

# https://github.com/helotism/helotism/issues/8#issuecomment-405390821
# Thank you!
# TODO check if it exists first
wget https://www.libarchive.org/downloads/libarchive-3.3.2.tar.gz
tar xzf libarchive-3.3.2.tar.gz
cd libarchive-3.3.2
./configure
make
make install

