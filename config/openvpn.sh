#!/bin/bash

source .var

apt update && apt -y install ca-certificates wget net-tools gnupg
wget -qO - https://as-repository.openvpn.net/as-repo-public.gpg | apt-key add -
echo "deb http://as-repository.openvpn.net/as/debian focal main">/etc/apt/sources.list.d/openvpn-as-repo.list
apt update && apt -y install openvpn-as

#cat <<EOF >> /etc/sysctl.conf
#net.ipv4.ip_forwarding=1
#EOF

#sysctl net.ipv4.ip_forwarding=1
#sysctl net.ipv4.ip_forwarding
#iptables -t nat -A POSTROUTING -s "$GATE4" -o "$NETADAPT" -j MASQUERADE
#iptables -t nat -I POSTROUTING -s "$GATE4" -d "$SUBNET" -o "$NETADAPT" -j MASQUERADE
#iptables-save
#ip route
#sudo ip route del default via 192.168.0.1
#sudo ip route add default via 192.168.0.1