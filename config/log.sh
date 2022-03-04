#!/bin/bash

source .var

cat <<EOF > log

###############################################################
|
|   SERVER INFO:
|
|     OS VERSION:     $OSVER
|
|     USER INFO:
|
|        - Username:  $USER
|        - Userpass:  $USERPASS
|
|     NETWORK:
|
|        - Subnet:    $SUBNET
|        - Gateway:   $GATE4
|        - Public IP: $PUBIP
|        - VPN admin: $VPNUSER
|        - VPN pass:  $VPNPASS
|
|     WEB:
|
|        - Cockpit:   $IP:9090
|        - Portainer: $IP:9000
|        - Grafana:   $IP:4020
|        - OpenVPN:   $IP:943
|        - Nginx:     $IP:81
|        - SpeedTest: $IP:3005
|        - Plex:      $IP:32400/web
|        - Prometheus:$IP:9010
|
|
|     EXPLORER:
|
|        - Samba:     $IP
|    
|     SSH:
|
|        - SSH allow: $SSHUSER
|        - SSH port:  $PORTSSH
|
###############################################################
|
|     CONNECT TO:
|
|        DASHBOARD ==>  $IP:9055
|              SSH ==>  ssh -p $PORTSSH $USER@$IP
|
###############################################################

EOF