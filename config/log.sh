#!/bin/bash

source .var

cat <<EOF > /home/$USER/config/log.txt
_________________________________________________________________
CREATED:
  
  USER INFO:
     - $USER
     - $USERPASS
  
  OPEN IN WEB:

     - $IP:9090       :Cockpit
     - $IP:32400/web  :Plex
     - $IP:80         :Website

    OPEN IN EXPLORER:

     - $IP            :Samba
     
    PUBLIC IP:

     - $PUBIP
    
    SSH:

     - $SSHUSER:SSH user
     - $PORTSSH:SSH port

  ssh -p $PORTSSH $USER@$IP
-----------------------------------------------------------------
EOF