#!/bin/bash

USER="user"
USERPASS="pass"
USERROLE="admin"
USERGROUP="usergr"
KEY="ENTER KEY.PUB"
MREZA=$(ip route | grep default | sed -e "s/^.*dev.//" -e "s/.proto.*//")
IP=$(ip route get 8.8.8.8 | sed -n '/src/{s/.*src *\([^ ]*\).*/\1/p;q}')


banner()
{
  echo "+------------------------------------------+"
  printf "| %-40s |\n" "$(date)"
  echo "|                                          |"
  printf "|$(tput bold) %-40s $(tput sgr0)|\n" "$@"
  echo "+------------------------------------------+"
}

banner2()
{
  echo "+------------------------------------------+"
  printf "|$(tput bold) %-40s $(tput sgr0)|\n" "$@"
  echo "+------------------------------------------+"
}

banner "S T A R T "

echo
echo

banner2 "C R E A T E  A D M I N"
useradd -p $(openssl passwd $USERPASS) $USER -m -c "$USERROLE" -G sudo -s /bin/bash
echo
echo "CREATED USER:$USER"

echo
echo

banner2 "L A P T O P  L I D  O F F"
systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
echo
echo "SLEEP IS OFF"

echo
echo

banner2 "U P D A T E  O S"
apt update && apt upgrade -y
echo
echo "ALL UP TO DATE"

echo
echo


banner2 "C R E A T E D  D I R"
mkdir /home/$USER/{.ssh,fileserver,}
mkdir /home/$USER/fileserver/{public_files,plexmedia}
mkdir /home/$USER/fileserver/plexmedia/{movies,series,cartoons,anime,photos,homevideo}
echo "
    CREATED DIR:
     - .ssh
     - fileserver
     - public_files
     - plexmedia"


echo
echo

banner2 "M E N A G E  U S E R S"
groupadd --system $USERGROUP
groupadd --system smbgroup
groupadd --system dockergroup
groupadd --system plexgroup

useradd --system --no-create-home --group smbgroup -s /bin/false smbuser
useradd --system --no-create-home --group dockergroup,$USERGROUP -s /bin/false docker
useradd --system --no-create-home --group plexgroup -s /bin/false plex

usermod -aG docker,adm $USER
chown -R $USER:$USER /home/$USER
chown -R smbuser:smbgroup /home/$USER/fileserver
chown -R $USER:docker /home/$USER
chown -R plex: /home/$USER/fileserver/plexmedia
chown -R smbuser:smbgroup /home/$USER/fileserver/plexmedia
echo "
    CREATED USERS:
     - $USER
     - Samba
     - Docker
     - Plex"

echo
echo

banner2 "S S H  K E Y"
echo "$KEY" >> /home/$USER/.ssh/authorized_keys
echo
echo "YOUR key IS ENTERED"

echo
echo

sleep 1s

banner2 "C O C K P I T"
apt install cockpit -y
cat <<EOF > /etc/netplan/00-installer-config.yaml
network:
  renderer: NetworkManager
  ethernets:
    $MREZA:
      dhcp4: true
  version: 2
EOF

netplan apply && service cockpit start

echo
echo

banner2 "P L E X"
curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -
echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list

apt update && echo y | apt install plexmediaserver -y

service plexmediaserver start
cat <<EOF > /etc/ufw/applications.d/plexmediaserver
[plexmediaserver]
title=Plex Media Server (Standard)
description=The Plex Media Server
ports=32400/tcp|3005/tcp|5353/udp|8324/tcp|32410:32414/udp

[plexmediaserver-dlna]
title=Plex Media Server (DLNA)
description=The Plex Media Server (additional DLNA capability only)
ports=1900/udp|32469/tcp

[plexmediaserver-all]
title=Plex Media Server (Standard + DLNA)
description=The Plex Media Server (with additional DLNA capability)
ports=32400/tcp|3005/tcp|5353/udp|8324/tcp|32410:32414/udp|1900/udp|32469/tcp
EOF

echo
echo

banner2 "S A M B A"
apt install samba -y && service smbd start

cat <<EOF > /etc/samba/smb.conf
[global]
server string = File Server
workgroup = WORKGROUP
security = user
map to guest = Bad User
name resolve order = bcast host
include = /etc/samba/shares.conf
EOF

cat <<EOF > /etc/samba/shares.conf
[Public Files]
path = home/$USER/fileserver/public_files
force user = smbuser
create mask = 0664
force create mode = 0664
directory mask = 0775
force directory mode = 0775
public = yes
writable = yes

[Plex]
path = home/$USER/fileserver/plexmedia
force user = smbuser
force group = smbgroup
create mask = 0664
force create mode = 0664
directory mask = 0775
force directory mode = 0775
public = yes
writable = yes
EOF

echo
echo

banner2 "D O C K E R"
apt install docker.io -y && apt install docker-compose -y

echo
echo

banner2 "C L O N E  G I T"
# Create docker-compose config
git clone https://github.com/sekkigit/webserver.git /home/$USER/docker

echo "
    CREATED:
     - .env
     - docker-compose.yml
     - default.conf"
echo
echo

banner2 "C O N F I G  U F W"
ufw app update plexmediaserver 
ufw allow 9090/tcp
ufw allow 3306/tcp
ufw allow 9000/tcp
ufw allow 80
ufw allow 443
ufw allow OpenSSH
ufw allow plexmediaserver-all
ufw allow Samba
sudo ufw --force enable
echo "
    OPEN PORTS:
     - SAMBA
     - DOCKER
     - PLEX     :32400
     - COCKPIT  :9090
     - HTTP     :443
     - HTTPS    :80
     - DB       :3306
     - WP       :9000"

echo
echo

banner2 "D O C K E R  P S"
docker ps

echo
echo

banner2 "I N S T A L L E D"
echo "
    SERVICES:
     - PLEX
     - SAMBA
     - DOCKER
     - COCKPIT"

echo
echo

banner2 "C H E K  S T A T U S"
echo "
  OPEN IN WEB:
     - $IP:80         :Website
     - $IP:9090       :Cockpit
     - $IP:32400/web  :Plex

    OPEN IN EXPLORER:
     - \\\$IP          :Samba"
echo

banner "ssh $USER@$IP : $USERPASS"

# sudo docker-compose -f /home/$USER/docker/docker-compose.yml up -d
# Need to run this when installation is finished
