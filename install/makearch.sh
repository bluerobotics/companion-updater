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
$DISK = $1

sudo umount $1?*

(
echo o # Create a new empty DOS partition table
echo n # Add a new partition
echo p # Primary partition
echo 1 # Partition number
echo   # First sector (Accept default: 1)
echo +100M # Last sector (Accept default: varies)
echo t # Select type
echo c # W95 FAT32 (LBA)
echo n # Add a new partition
echo p # p for primary
echo 2 # Second partition
echo   # First available block
echo +4G  # 4G size
echo p # Print results
echo w # Write changes
) | sudo fdisk $1

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
sudo mv root/boot/* boot
sudo umount boot root
popd

echo done
