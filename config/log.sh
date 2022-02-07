#!/bin/bash

source .var

cat <<EOF > log
|
|   SERVER INFO:
|
|     OS VERSION:     $OSVER
|
|     USER INFO:
|        - Username:  $USER
|        - Userpass:  $USERPASS
|
|     NETWORK:
|        - Subnet:    $SUBNET
|        - Gateway:   $GATE4
|        - Public IP: $PUBIP
|
|     WEB:
|        - Dashboard: $IP:9055
|        - Cockpit:   $IP:9090
|        - Portainer: $IP:9000
|        - Grafana:   $IP:4020
|        - Nginx:     $IP:81
|        - SpeedTest: $IP:3005
|        - Plex:      $IP:32400/web
|        - Prometheus:$IP:9010
|
|
|     EXPLORER:
|        - Samba:     $IP
|    
|     SSH:
|        - SSH user:  $SSHUSER
|        - SSH port:  $PORTSSH
|
|###########################################################
|  CONNECT 
|          HTTP ==>  $IP:9055
|          SSH  ==>  ssh -p $PORTSSH $USER@$IP
|###########################################################
EOF