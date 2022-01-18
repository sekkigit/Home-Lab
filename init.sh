#!/bin/bash

# Scrip installs all the software needed for my "Home Lab" server:
# Cockpit, Samba, Plex, Fail2Ban, Docker, and Docker-compose
# The server can run a web-based graphical interface,
# website hosting, file server, stream videos, photos, and audio. 
# Website hosting runs on Nginx, WordPress, and Mysql.

source config/.var

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

banner "    S T A R T "

echo
echo

banner2 "    C R E A T E  U S E R"
useradd -p $(openssl passwd $USERPASS) $USER -m -c "$USERROLL" -G sudo -s /bin/bash
echo
echo "        $USER"

echo
echo

banner2 "    L A P T O P  L I D  O F F"
systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
echo
echo "HIBERNATE/SLEEP/SUSPEND IS OFF"

echo
echo

banner2 "    U P D A T E  O S"
apt update && apt upgrade -y
echo
echo "ALL UP TO DAIT"

echo
echo


banner2 "    C R E A T E D  D I R"
bash ./config/dirtree.sh
echo "
     - .ssh
     - $SAMBA
     - public_files
     - $PLEX"


echo
echo

banner2 "    P O L I C Y  U P D A T E"
bash ./config/dirpolicy.sh
echo "
     - $USER
     - Samba
     - Docker
     - Plex"

echo
echo

banner2 "    S S H  K E Y"
echo "$KEY" >> /home/$USER/.ssh/authorized_keys
echo
echo "SSH KEY FROM "$SSHUSER" ADDED"

echo
echo

banner2 "    L O C K  S S H"
bash ./config/lock_ssh.sh

echo
echo

sleep 2s

banner2 "    C O C K P I T  S E T U P"
apt install cockpit -y
bash ./config/network.sh
netplan apply && service cockpit start

echo
echo

banner2 "    S A M B A  S E T U P"
apt install samba -y
bash ./config/sambaconfig.sh
service smbd start

echo
echo

banner2 "    P L E X  S E T U P"
curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -
echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list

apt update
echo y | apt install plexmediaserver -y
bash ./config/plexufw.sh
service plexmediaserver start

echo
echo

banner2 "    D O C K E R  S E T U P"
apt install docker.io -y && apt install docker-compose -y

echo
echo

banner2 "    W E B S I T E  C O N F I G"
git clone https://github.com/sekkigit/wordpress.git /home/$USER/docker

echo "
    CREATED:

     - .env
     - docker-compose.yml
     - default.conf"
echo
echo

banner2 "    U F W  C O N F I G"
bash ./config/firewall.sh

sleep 2

echo
echo

banner2 "    F A I L 2 B A N"
apt install fail2ban -y
systemctl enable fail2ban
systemctl start fail2ban
echo
echo "Fail2Ban STARTED"

echo
echo

banner2 "    D O C K E R - C O M P O S E  U P"
docker-compose -f /home/$USER/docker/docker-compose.yml up -d
docker ps

echo
echo

banner2 "    C L E A N  U P  P A C K A G E"
apt autoclean
apt autoremove
apt clean

echo
echo

banner2 "    I N S T A L L E D"
echo "
    SERVICES:

     - COCKPIT
     - DOCKER
     - SAMBA
     - PLEX
     - UFW
     - FAIL2BAN"

echo
echo

banner2 "C H E K  S T A T U S"
bash ./config/log.sh
cat ./config/log.txt
banner "    R E A D Y ! ! !"