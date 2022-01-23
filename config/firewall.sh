#!/bin/bash

source .var

ufw app update plexmediaserver
ufw default reject incoming
ufw default allow outgoing
ufw limit $PORTSSH/tcp
ufw allow 80
ufw allow 443
ufw allow from $SUBNET to any port 9090
ufw allow from $SUBNET to any port 9000
ufw allow from $SUBNET to any port 81
ufw allow from $SUBNET to any app Samba
ufw allow plexmediaserver-all
ufw --force enable
ufw status