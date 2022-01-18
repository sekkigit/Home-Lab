#!/bin/bash

source .var

cat <<EOF > log.txt
_________________________________________________________________________
CREATED:
  
  USER INFO:
     - $USER
     - $USERPASS
  
  OPEN IN WEB:

     - Cockpit:   $IP:9090       
     - Plex:      $IP:32400/web
     - Website:   $IP:80
     - Public IP: $PUBIP

  OPEN IN EXPLORER:

     - Samba:     $IP
    
  SSH:

     - SSH user:  $SSHUSER
     - SSH port:  $PORTSSH

CONNECT TO ===> ssh -p $PORTSSH $USER@$IP
-------------------------------------------------------------------------
EOF