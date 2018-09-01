#!/usr/bin/env bash

PART1=$11
PART2=$12
PART3=$13

#TODO proceed anyway..

echo "Making vfat filesystem on $PART1..."
mkfs.vfat $PART1

echo "Making ext4 filesystem on $PART2..."
mkfs.ext4 $PART2

echo "Making ext4 filesystem on $PART3..."
mkfs.ext4 $PART3

