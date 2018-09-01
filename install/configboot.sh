#!/bin/bash

# backup original
mv boot.txt boot.txt.orig

# copy our own in place of the original
mv conf/boot.txt .

# generate a new .scr
sudo mkscr

