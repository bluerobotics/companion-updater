#!/usr/bin/bash

# Install arch for the raspberry pi 3 on a disk (hopefully an sd card)

pushd /tmp

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

prepare-disk.sh $DISK $RECOVERYSIZE $COMPANIONSIZE 

exit 1

sudo mkfs.vfat $11
mkdir boot
sudo mount $1 boot

mkfs.ext4 $12
mkdir root
sudo mount $12 root

# https://github.com/helotism/helotism/issues/8#issuecomment-405390821
# Thank you!
wget https://www.libarchive.org/downloads/libarchive-3.3.2.tar.gz
tar xzf libarchive-3.3.2.tar.gz
cd libarchive-3.3.2
./configure
make
sudo make install

wget http://os.archlinuxarm.org/os/ArchLinuxARM-rpi-3-latest.tar.gz
sudo bsdtar -xpf ArchLinuxARM-rpi-3-latest.tar.gz -C root

sync

#sudo pacstrap boot apache php php-intl php-apache

arch-chroot root
sudo pacman -S root apache php php-intl php-apache
sudo systemctl enable httpd
exit

# move webserver files onto root
sudo mv ../conf/* root

sudo mv root/boot/* boot
sudo umount boot root

dd if=$COMPANIONIMG of=$13 bs=4M
sync

# Go back to previous directory
popd

echo done
