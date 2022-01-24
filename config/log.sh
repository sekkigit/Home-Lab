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

     - Cockpit:   $IP:9090       
     - Portainer: $IP:9000
     - Plex:      $IP:32400/web
     - Public IP: $PUBIP

  EXPLORER:

     - Samba:     $IP
    
  SSH:

     - SSH user:  $SSHUSER
     - SSH port:  $PORTSSH

CONNECT TO ==> ssh -p $PORTSSH $USER@$IP
-------------------------------------------------------------------------
EOF