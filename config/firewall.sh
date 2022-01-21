#!/bin/bash

source .var

ufw default reject incoming
ufw default allow outgoing
ufw limit $PORTSSH/tcp
ufw allow 80
ufw allow 443
ufw allow 8080
ufw allow from 192.168.0.0/24 to any port 9090/tcp
ufw allow from 192.168.0.0/24 to any port 9000/tcp
ufw allow from 192.168.0.0/24 to any port 81
ufw allow from 192.168.0.0/24 to any port Samba
ufw app update plexmediaserver
ufw allow plexmediaserver-all
ufw --force enable
ufw status