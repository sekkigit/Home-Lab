#!/bin/bash

source .var

cat <<EOF > log.txt
_________________________________________________________________________
INFO:

  OS VERSION:     $OSVER

  USER INFO:
     - Username:  $USER
     - Userpass:  $USERPASS
     - Subnet:    $SUBNET
     - Gateway:   $GATE4
  
  WEB:

     - Dashboard: $IP:9055
     - Cockpit:   $IP:9090
     - Nginx:     $IP:8181
     - Portainer: $IP:9000
     - Plex:      $IP:32400/web
     - SpeedTest: $IP:3000
     - Public IP: $PUBIP

  EXPLORER:

     - Samba:     $IP
    
  SSH:

     - SSH user:  $SSHUSER
     - SSH port:  $PORTSSH

CONNECT TO ==> ssh -p $PORTSSH $USER@$IP
-------------------------------------------------------------------------
EOF