#!/usr/bin/env bash

BOOTDISK=$1
ROOTDISK=$2
BOOTMNT=$3
ROOTMNT=$4

mkdir $BOOTNMNT
mkdir $ROOTMNT

umount $BOOTDISK
umount $ROOTDISK

mount $BOOTDISK $BOOTMNT
mount $ROOTDISK $ROOTMNT

wget http://os.archlinuxarm.org/os/ArchLinuxARM-rpi-3-latest.tar.gz
bsdtar -xpf ArchLinuxARM-rpi-3-latest.tar.gz -C $ROOTMNT

mv $ROOTMNT/boot/* $BOOTMNT
sync
umount $BOOTMNT
umount $ROOTMNT


