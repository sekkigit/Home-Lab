#!/bin/bash

#########################################################################
# Scrip installs all the software needed for "Home Lab" server:         #
# Cockpit, Samba, Plex, Fail2Ban, Portainer, Docker, and Docker-compose #
#########################################################################

source .var

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

clear
banner "    S T A R T "
apt install pv
echo
echo

banner2 "    L A P T O P  L I D  O F F"
systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target | pv > /dev/null
echo
echo "HIBERNATE/SLEEP/SUSPEND IS OFF"

echo
echo

banner2 "    S W A P  P A R T I T I O N"
bash ./config/swap.sh | pv > /dev/null
echo
echo "CREATED $RAM MB SWAP PARTITION"

echo
echo

banner2 "    U P D A T E  O S"
apt update && apt upgrade -y | pv > /dev/null
echo
echo "ALL UP TO DAIT"

echo
echo

banner2 "    C R E A T E  U S E R"
useradd -p $(openssl passwd $USERPASS) $USER -m -c "$USERROLL" -G sudo -s /bin/bash
echo
echo "        $USER"

echo
echo

banner2 "    C R E A T E D  D I R"
bash ./config/dirtree.sh | pv > /dev/null
echo "
     - .ssh
     - $SAMBA
     - public_files
     - $PLEX"

echo
echo

banner2 "    P O L I C Y  U P D A T E"
bash ./config/dirpolicy.sh | pv > /dev/null
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
bash ./config/lock_ssh.sh | pv > /dev/null

echo
echo

sleep 2s

banner2 "    C O C K P I T  S E T U P"
apt install cockpit -y
bash ./config/network.sh | pv > /dev/null
netplan apply && service cockpit start

echo
echo

banner2 "    S A M B A  S E T U P"
apt install samba -y
bash ./config/sambaconfig.sh | pv > /dev/null
service smbd start

echo
echo

banner2 "    P L E X  S E T U P"
curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -
echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list

apt update
echo y | apt install plexmediaserver -y
bash ./config/plexufw.sh | pv > /dev/null
service plexmediaserver start

echo
echo

banner2 "    D O C K E R  S E T U P"
apt install docker.io -y && apt install docker-compose -y

echo
echo

banner2 "    R U N  C O N T A I N E R S"
bash ./config/docker-env.sh | pv > /dev/null
cp ./config/docker-compose.yml /home/$USER/docker/docker-compose.yml
docker-compose -f /home/$USER/docker/docker-compose.yml up -d
mv /home/$USER/docker/homer/config.yml /home/$USER/docker/homer/config.yml.original
bash ./config/homer.sh | pv > /dev/null
docker ps

echo
echo

banner2 "    U F W  C O N F I G"
bash ./config/firewall.sh | pv > /dev/null

sleep 2

echo
echo

banner2 "    F A I L 2 B A N"
apt install fail2ban -y | pv > /dev/null
systemctl enable fail2ban
systemctl start fail2ban
echo
echo "Fail2Ban STARTED"

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
cp log.txt /home/$USER/log.txt
cat log.txt
banner "    R E A D Y ! ! !"