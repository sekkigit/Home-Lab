#!/bin/bash

source .var

cat <<EOF > log
____________________________________________________________
| 
|   SERVER INFO:
|
|     OS VERSION:     $OSVER
|
|     USER INFO:
|        - Username:  $USER
|        - Userpass:  $USERPASS
|        - Subnet:    $SUBNET
|        - Gateway:   $GATE4
|  
|     WEB:
|
|        - Dashboard: $IP:9055
|        - Grafana:   $IP:4020
|        - Cockpit:   $IP:9090
|        - Treafik:   $IP:81 ----------- user:admin / pass:$TREAFIKPASS
|        - Portainer: $IP:9000
|        - Plex:      $IP:32400/web
|        - SpeedTest: $IP:3005
|        - Prometheus:$IP:9010
|        - Cadvisor:  $IP:8030
|        - Public IP: $PUBIP
|
|     EXPLORER:
|
|        - Samba:     $IP
|    
|     SSH:
|
|        - SSH user:  $SSHUSER
|        - SSH port:  $PORTSSH
|
|  CONNECT WITH SSH  ==>  ssh -p $PORTSSH $USER@$IP
|  CONNECT WITH HTTP ==>  $IP:9055
____________________________________________________________
EOF