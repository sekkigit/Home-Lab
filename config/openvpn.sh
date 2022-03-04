#!/bin/bash

source .var

apt install ca-certificates wget net-tools gnupg -y
wget -qO - https://as-repository.openvpn.net/as-repo-public.gpg | apt-key add -
echo "deb http://as-repository.openvpn.net/as/debian focal main">/etc/apt/sources.list.d/openvpn-as-repo.list
apt update
apt install openvpn-as -y

sudo sysctl net.ipv4.ip_forward=1
iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -o ens5 -j MASQUERADE
iptables-save