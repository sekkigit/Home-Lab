#!/bin/bash

source .var

ufw app update plexmediaserver
ufw default reject incoming
ufw default allow outgoing
ufw limit $PORTSSH/tcp
ufw allow 80
ufw allow 443
ufw allow from $SUBNET to any port 9090
ufw allow from $SUBNET to any port 9055
ufw allow from $SUBNET to any port 9099
ufw allow from $SUBNET to any port 8030
ufw allow from $SUBNET to any port 4020
ufw allow from $SUBNET to any port 3005
ufw allow from $SUBNET to any port 3006
ufw allow from $SUBNET to any port 81
ufw allow from $SUBNET to any app Samba
ufw allow plexmediaserver-all
ufw --force enable