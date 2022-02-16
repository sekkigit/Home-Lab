#!/bin/bash

curl -s https://packagecloud.io/install/repositories/crowdsec/crowdsec/script.deb.sh | sudo bash
apt install crowdsec -y
apt install crowdsec-firewall-bouncer-iptables -y
systemctl start crowdsec && systemctl enable crowdsec