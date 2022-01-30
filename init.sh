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
banner "              S T A R T "
echo
echo

banner2 "     L A P T O P  L I D  O F F"
bash ./config/hybrid-sleep.sh &> /dev/null
echo
echo "         HIBERNATE/SLEEP/SUSPEND IS OFF"

echo
echo

banner2 "     S W A P  P A R T I T I O N"
bash ./config/swap.sh &> /dev/null
echo
echo "         CREATED $RAM MB SWAP PARTITION"

echo
echo

banner2 "     U P D A T E  O S"
bash ./config/update_os.sh &> /dev/null
echo
echo "         ALL UP TO DAIT"

echo
echo

banner2 "     C R E A T E  U S E R"
useradd -p $(openssl passwd $USERPASS) $USER -m -c "$USERROLL" -G sudo -s /bin/bash
echo
echo "          User: $USER"

echo
echo

banner2 "     C R E A T E D  D I R"
bash ./config/dirtree.sh &> /dev/null
echo "
          - .ssh
          - $SAMBA
          - public_files
          - $PLEX"

echo
echo

banner2 "     S S H  K E Y"
bash ./config/lock_ssh.sh &> /dev/null
echo
echo "         SSH KEY FROM "$SSHUSER" ADDED"

echo
echo

banner2 "     C O C K P I T  S E T U P"
bash ./config/cockpit.sh &> /dev/null
bash ./config/network.sh &> /dev/null
echo
echo "         Cockpit STARTED"

echo
echo

banner2 "     S A M B A  S E T U P"
bash ./config/samba.sh &> /dev/null
bash ./config/sambaconfig.sh &> /dev/null
echo
samba --version
echo
echo "         Samba STARTED"

echo
echo

banner2 "     P L E X  S E T U P"
bash ./config/plex.sh &> /dev/null
bash ./config/plexufw.sh &> /dev/null
echo
echo "         Plex STARTED"

echo
echo

banner2 "     F A I L 2 B A N"
bash ./config/fail2ban.sh &> /dev/null
echo
echo "         Fail2Ban STARTED"

echo
echo

banner2 "     C L E A N  U P  P A C K A G E S"
bash ./config/clear.sh &> /dev/null
echo
echo "         Packages cleared"

echo
echo

banner2 "     P O L I C Y  U P D A T E"
bash ./config/dirpolicy.sh &> /dev/null
echo "
          - $USER
          - Samba
          - Docker
          - Plex"

echo
echo

banner2 "     D O C K E R  S E T U P"
bash ./config/docker.sh &> /dev/null
echo
docker --version && docker-compose --version

echo
echo

banner2 "     R U N  C O N T A I N E R S"
echo
bash ./config/docker-env.sh &> /dev/null
cp ./config/docker-compose.yml /home/$USER/docker/docker-compose.yml
docker-compose -f /home/$USER/docker/docker-compose.yml up -d
bash ./config/homer.sh &> /dev/null
bash ./config/prometheus.sh &> /dev/null
echo
docker ps

echo
echo

banner2 "     U F W  C O N F I G"
bash ./config/firewall.sh &> /dev/null
echo
ufw status

echo
echo

banner2 "     I N F O"
bash ./config/log.sh &> /dev/null
cp log /home/$USER/log
cat log
banner "           R E A D Y ! ! !"