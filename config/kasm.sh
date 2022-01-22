#!/bin/bash

# Create streaming containerized apps and desktops for end-users
# Resource Requirements: 2 cores, 4GB ram, 50GB SSD
# https://www.kasmweb.com/docs/latest/install/single_server_install.html

wget https://kasm-static-content.s3.amazonaws.com/kasm_release_1.10.0.238225.tar.gz
tar -xf kasm_release_1.10.0.238225.tar.gz
echo y | kasm_release/install.sh