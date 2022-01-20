#!/bin/bash

source .var

cat <<EOF > /etc/netplan/00-installer-config.yaml
network:
  renderer: NetworkManager
  ethernets:
    $NETADAPT:
      dhcp4: true
  version: 2
EOF