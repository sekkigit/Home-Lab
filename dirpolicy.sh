#!/bin/bash

source .var

groupadd --system $USERGROUP
groupadd --system smbgroup
groupadd --system dockergroup
groupadd --system plexgroup

useradd --system --no-create-home --group dockergroup,$USERGROUP -s /bin/false docker
useradd --system --no-create-home --group smbgroup -s /bin/false smbuser
useradd --system --no-create-home --group plexgroup -s /bin/false plex

usermod -aG docker,adm $USER

chown -R $USER:$USER /home/$USER
chown -R plex: /home/$USER/$SAMBA/$PLEX
chown -R $USER:docker /home/$USER

chown -R smbuser:smbgroup /home/$USER/$SAMBA
chmod -R g+w /home/$USER/$SAMBA