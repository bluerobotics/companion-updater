#!/usr/bin/env bash
#lends you some flexibility on different systems

# https://stackoverflow.com/a/16365367
# Thank you!

# creates a new DOS partition table (4 primary partitions allowed)
# creates and labels 3 partitions:
# 1. companion_boot: 100MiB
# 2. companion_recover
# 3. companion_run
DISK=$1
RECOVERYSIZE=$2
COMPANIONSIZE=$3

# not implemented
# TODO replace companion size with staging size to indicate size for uploading
# compressed images at the end of the disk. Then, create a partiion occupying
# the remaining space between Recovery and Staging #STAGINGSIZE=
echo "unmounting $DISK..."
umount $DISK?*

echo "formatting $DISK..."

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
echo +$RECOVERYSIZE  # size
echo n # Add a new partition
echo p # p for primary
echo 3 # Third partition
echo   # First available block
echo +$COMPANIONSIZE  # size
echo p # Print results
echo w # Write changes
) | fdisk $DISK

