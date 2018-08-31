#!/usr/bin/bash

# @file copyarch.sh
# @author Jacob Walser
# @
# @copy a current arch installation to a local compressed image

DISK=$1

# https://stackoverflow.com/a/6482403
# Thank you!
if [ -z "$2" ]
then
  echo "Destination is required!"
  exit 1
fi

IMG=$2

# check the disk out

# lsblk -a should give something like this
# ```
# sdg      8:96   1  14.9G  0 disk 
# ├─sdg1   8:97   1   100M  0 part /media/jack/17DC...
# └─sdg2   8:98   1     4G  0 part /media/jack/d3020...
# ```

# use lsblk -l for the same output but easier to parse with scripts
# ```
# sdg     8:96   1  14.9G  0 disk 
# sdg1    8:97   1   100M  0 part /media/jack/17DC...
# sdg2    8:98   1     4G  0 part /media/jack/d3020060...
# ```

# unmount the disk (always do this first)
sudo umount $DISK?*

# -s script mode, never wait for stdin
# -m machine mode, output easy to parse by machines
# $DISK the disk to inspect
# unit MiB print -> a sequence of commands to submit (as if you were at the parted command line)
# set units to MiB and print the partition table
# 
#parted -sm $DISK unit MiB print

# select the last line of text
# tail -1

# select the third field, using ':' as the delimiter
# cut -d: -f3
ENDBLK=$(parted -sm $DISK unit MiB print | tail -1 | cut -d: -f3)

# https://askubuntu.com/a/89999
# Thank you!
ENDBLK=${ENDBLK%"MiB"}

# https://unix.stackexchange.com/a/232386
# Thank you!
# arithmetic expansion operator (( ))
ENDBLK=$(($ENDBLK + 1))

echo "copying $DISK to $IMG"
echo "size is $ENDBLK MiB"

# exit 99

# units are in MiB (hopefully, as above)
sudo dd if=$DISK of=$IMG bs=1M count=$ENDBLK status=progress
sync
exit 0

