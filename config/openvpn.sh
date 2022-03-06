#!/bin/bash

apt update && apt -y install ca-certificates wget net-tools gnupg
wget -qO - https://as-repository.openvpn.net/as-repo-public.gpg | apt-key add -
echo "deb http://as-repository.openvpn.net/as/debian focal main">/etc/apt/sources.list.d/openvpn-as-repo.list
apt update && apt -y install openvpn-as

cat <<EOF >> /etc/sysctl.conf
net.ipv4.ip_forwarding=1
EOF
sysctl net.ipv4.ip_forwarding=1
sysctl net.ipv4.ip_forwarding
iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -o ens5 -j MASQUERADE
iptables -t nat -I POSTROUTING -s 10.8.0.0/16 -d 192.168.0.0/16 -o ens5 -j MASQUERADE
iptables-save
#ip route
#sudo ip route del default via 192.168.0.1
#sudo ip route add default via 192.168.0.1