#!/bin/bash

source .var

ufw app update plexmediaserver
ufw default reject incoming
ufw default allow outgoing
ufw limit $PORTSSH/tcp
ufw allow 80/tcp   #HTTP
ufw allow 443/tcp  #HTTPS
ufw allow 9055/tcp #Homr
ufw allow 4020/tcp #Grafana
ufw limit 9010 #Prometheus
ufw allow 943 #OpenVPN
ufw allow 9443 #OpenVPN
ufw allow 1194/udp #OpenVPN
#ufw allow 9000 #Portainer
#ufw allow 3005 #SpeedTest
#ufw allow 81   #Nginx
ufw allow from $SUBNET to any port 9090 proto tcp #Cockpit
ufw allow from $SUBNET to any app Samba
ufw allow plexmediaserver-all
ufw --force enable