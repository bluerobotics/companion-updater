#!/usr/bin/env bash

BOOTDISK=$1
ROOTDISK=$2
BOOTMNT=$3
ROOTMNT=$4
MNTDIR=/mnt
IMGBOOT="imageboot"
IMGROOT="imageroot"

#Check if 5th argument was provided.
#If not, check if the file already exist. If it doesnt exist, download the file. and then unzip it.
#If the 5th argument is provided, unzip the file from that path.
if [ -z "$5" ]; then
	if [ ! -f raspbian_lite_latest ]; then
		wget https://downloads.raspberrypi.org/raspbian_lite_latest
	fi
	unzip -o 'raspbian_lite_latest'
else
	unzip -o "$5"
fi

#Get the start location for root and boot partitions in MiB. 
bootstart=$(sudo parted -sm *lite.img unit MiB print | grep 'fat32' | cut -f2 -d: | cut -f1 -d.)
rootstart=$(sudo parted -sm *lite.img unit MiB print | grep 'ext4' | cut -f2 -d: | cut -f1 -d.)

#Convert into bytes to get the offset.
bootoffset=$(($bootstart*1048576))
rootoffset=$(($rootstart*1048576))

echo "imageroot $MNTDIR/$IMGROOT"
echo "imageboot $MNTDIR/$IMGBOOT"
echo "rootmnt $ROOTMNT"
echo "bootmnt $BOOTMNT"
echo "bootdisk $BOOTDISK"
echo "rootdisk $ROOTDISK"

umount $BOOTDISK
umount $ROOTDISK

rm -r $BOOTMNT; sudo mkdir $BOOTMNT
rm -r $ROOTMNT; sudo mkdir $ROOTMNT
rm -r $MNTDIR/$IMGBOOT; sudo mkdir $MNTDIR/$IMGBOOT
rm -r $MNTDIR/$IMGROOT; sudo mkdir $MNTDIR/$IMGROOT

mount $BOOTDISK $BOOTMNT
mount $ROOTDISK $ROOTMNT

#Mount boot and root partitions of the image onto respective mount points.

sudo mount -o loop,offset=$bootoffset 2018-06-27-raspbian-stretch-lite.img $MNTDIR/$IMGBOOT
sudo cp -a $MNTDIR/$IMGBOOT/. $BOOTMNT
sudo umount $MNTDIR/$IMGBOOT

sudo mount -o loop,offset=$rootoffset 2018-06-27-raspbian-stretch-lite.img $MNTDIR/$IMGROOT 
sudo cp -a $MNTDIR/$IMGROOT/. $ROOTMNT
sudo umount $MNTDIR/$IMGROOT

#Replace the companion partition number with Recovery partition number in /boot/cmdline.txt
#Enables booting into the Recovery partition and accessing the Recovery server.
sudo -H -u root bash -c "sed -i -e 's/\-02/\-03/' $BOOTMNT/cmdline.txt"
 
umount $BOOTMNT
umount $ROOTMNT


