#!/bin/bash

source .var

ufw app update plexmediaserver
ufw default reject incoming
ufw default allow outgoing
ufw limit $PORTSSH/tcp
ufw allow 80   #HTTP
ufw allow 443  #HTTPS
ufw allow 9090 #Cockpit
ufw allow 9055 #Homr
ufw allow 9010 #Prometheus
ufw allow 9000 #Portainer
ufw allow 4020 #Grafana
ufw allow 3005 #SpeedTest
ufw allow 81   #Nginx
ufw allow from $SUBNET to any app Samba
ufw allow plexmediaserver-all
ufw --force enable