#!/usr/bin/env bash

# test prepare-disk.sh

# create 3 partitions
# disk
# |-boot
# |-recover
# |-companion

echo "testing prepare-disk.sh $1 $2 $3"
./prepare-disk.sh $1 $2 $3

echo "prepare-disk returned with $?"

