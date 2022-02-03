#!/bin/bash

source .var

cat <<EOF > /etc/netplan/00-installer-config.yaml
network:
  version: 2
  renderer: NetworkManager
  ethernets:
    $NETADAPT:
      dhcp4: no
      dhcp6: no
      addresses: [$IP/24]
      gateway4:  $GATE4
      nameservers:
              addresses: [8.8.4.4, 8.8.8.8]
EOF

netplan apply && service cockpit start && systemctl start cockpit