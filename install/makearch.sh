#!/usr/bin/env bash

# Install arch for the raspberry pi 3 on a disk (hopefully an sd card)

MOUNTDIR="/tmp"
BOOTMNTPT="boot"
ROOTMNTPT="root"

###
# Installation steps
# Choose disk (eg /dev/sdX)
# 1 Create new partition table (format disk)
# (DOS partition table, use g instead of o for first step to use the newer GPT) 
# Create boot partition (100MiB, Win95 FAT32 LBA)
# Create root partition (
# Create 
DISK=$1

RECOVERYSIZE=2G
COMPANIONSIZE=2G

#TODO check minimum disk size

#TODO validate args
#TODO create arch installation with companion installed
#COMPANIONIMG=$2

echo "preparing disk..."
./prepare-disk.sh $DISK $RECOVERYSIZE $COMPANIONSIZE

echo "preparing filesystem..."
./prepare-filesystem.sh $DISK

#exit 1




echo "installing bsdtar..."
./install-bsdtar.sh

echo "installing arch..."
./install-arch.sh $DISK $DISK2 $MOUNTDIR/$BOOTMNTPT $MOUNTDIR/$ROOTMNTPT

echo "installing arch..."
./install-arch.sh $DISK $DISK3 $MOUNTDIR/$BOOTMNTPT $MOUNTDIR/$ROOTMNTPT

echo "preparing boot.scr..."
./prepare-bootscr.sh $DISK1 $MOUNTDIR/$BOOTMNTPT


#sudo pacstrap boot apache php php-intl php-apache

#arch-chroot root
#pacman -S root apache php php-intl php-apache
#systemctl enable httpd
#exit

# move webserver files onto root
#mv ../conf/* root



#dd if=$COMPANIONIMG of=$13 bs=4M
#sync

echo "done"

