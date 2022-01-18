#!/bin/bash

source .var

ufw default reject incoming
ufw default allow outgoing
ufw limit $PORTSSH/tcp
ufw allow 9090/tcp
ufw allow 80
ufw allow 443
ufw allow Samba
ufw app update plexmediaserver
ufw allow plexmediaserver-all
ufw --force enable
ufw status