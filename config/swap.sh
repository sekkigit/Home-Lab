#!/bin/bash

source .var

# Create 1GiB swap partition
sudo dd if=/dev/zero bs=1M count=$RAM of=/mnt/1GiB.swap
sudo chmod 600 /mnt/1GiB.swap
sudo mkswap /mnt/1GiB.swap
sudo swapon /mnt/1GiB.swap
cat /proc/swaps
echo '/mnt/1GiB.swap swap swap defaults 0 0' | sudo tee -a /etc/fstab