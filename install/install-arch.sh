#!/usr/bin/env bash

BOOTDISK=$1
ROOTDISK=$2
BOOTMNT=$3
ROOTMNT=$4

echo "rootmnt $ROOTMNT"
echo "bootmnt $BOOTMNT"
echo "bootdisk $BOOTDISK"
echo "rootdisk $ROOTDISK"

mkdir $BOOTMNT
mkdir $ROOTMNT

umount $BOOTDISK
umount $ROOTDISK

mount $BOOTDISK $BOOTMNT
mount $ROOTDISK $ROOTMNT

if [ ! -f ArchLinuxARM-rpi-3-latest.tar.gz ]; then
wget http://os.archlinuxarm.org/os/ArchLinuxARM-rpi-3-latest.tar.gz
fi

bsdtar -xpf ArchLinuxARM-rpi-3-latest.tar.gz -C $ROOTMNT

mv $ROOTMNT/boot/* $BOOTMNT
sync
umount $BOOTMNT
umount $ROOTMNT


