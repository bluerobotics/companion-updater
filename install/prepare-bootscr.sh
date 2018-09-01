#!/usr/bin/env bash

BOOTDISK=$1
BOOTMNT=$2

umount $BOOTDISK

mount $BOOTDISK $BOOTMNT

mv $BOOTMNT/boot.txt $BOOTMNT/boot.txt.orig

cp ../conf/boot.txt $BOOTMNT

pushd $BOOTMNT

./mkscr
popd

umount $BOOTMNT

