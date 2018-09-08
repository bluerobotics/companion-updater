#!/usr/bin/env bash

#Install raspbian for the Raspberry pi 3 on a disk (hopefully an SD card)

MOUNTDIR="/mnt"
BOOTMNTPT="newboot"
ROOTMNTPT="newroot"

###
# Installation steps
# Choose disk (eg /dev/sdX)
# 1 Create new partition table (format disk)
# (DOS partition table, use g instead of o for first step to use the newer GPT) 
# Create boot partition (100MiB, Win95 FAT32 LBA)
# Create root partition (
# Create 
DISK=$1

RECOVERYSIZE=5G
COMPANIONSIZE=5G

#TODO check minimum disk size

#TODO validate args
#TODO create arch installation with companion installed
#COMPANIONIMG=$2

echo "preparing disk..."
sudo ./prepare-disk.sh $DISK $RECOVERYSIZE $COMPANIONSIZE

echo "preparing filesystem..."
sudo ./prepare-filesystem.sh $DISK

#exit 1

echo "installing raspbian..."
sudo ./install-raspbian.sh ${DISK}1 ${DISK}2 $MOUNTDIR/$BOOTMNTPT $MOUNTDIR/$ROOTMNTPT

echo "installing raspbian..."
sudo ./install-raspbian.sh ${DISK}1 ${DISK}3 $MOUNTDIR/$BOOTMNTPT $MOUNTDIR/$ROOTMNTPT

echo "done"