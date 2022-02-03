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

bash ./config/timezone.sh &> /dev/null
clear
banner "              S T A R T "
echo
echo

banner2 "     L A P T O P  L I D  O F F"
bash ./config/hybrid-sleep.sh &> /dev/null
echo
echo -e "$COLOR       HIBERNATE/SLEEP/SUSPEND IS OFF\e[0m"

echo
echo

banner2 "     S W A P  P A R T I T I O N"
bash ./config/swap.sh &> /dev/null
echo
echo -e "$COLOR         CREATED $RAM MB SWAP PARTITION\e[0m"

echo
echo

banner2 "     U P D A T E  O S"
bash ./config/update_os.sh &> /dev/null
echo
echo -e "$COLOR         ALL UP TO DAIT\e[0m"

echo
echo

banner2 "     C R E A T E  U S E R"
useradd -p $(openssl passwd $USERPASS) $USER -m -c "$USERROLL" -G sudo -s /bin/bash
echo
echo -e "$COLOR          User: $USER\e[0m"

echo
echo

banner2 "     C R E A T E D  D I R"
bash ./config/dirtree.sh &> /dev/null
echo -e "$COLOR
          - .ssh
          - $SAMBA
          - public_files
          - $PLEX\e[0m"

echo
echo

banner2 "     S S H  K E Y"
bash ./config/lock_ssh.sh &> /dev/null
echo
echo -e "$COLOR         SSH KEY FROM "$SSHUSER" ADDED\e[0m"

echo
echo

banner2 "     C O C K P I T  S E T U P"
bash ./config/cockpit.sh &> /dev/null
bash ./config/network.sh &> /dev/null
echo
echo -e "$COLOR         Cockpit is $(systemctl is-enabled cockpit) and $(systemctl is-active cockpit)\e[0m"

echo
echo

banner2 "     S A M B A  S E T U P"
bash ./config/samba.sh &> /dev/null
bash ./config/sambaconfig.sh &> /dev/null
echo
samba --version
echo
echo -e "$COLOR         Samba is $(systemctl is-enabled smbd) and $(systemctl is-active smbd)\e[0m"


echo
echo

banner2 "     P L E X  S E T U P"
bash ./config/plex.sh &> /dev/null
bash ./config/plexufw.sh &> /dev/null
echo
echo -e "$COLOR         Plex is $(systemctl is-enabled plexmediaserver) and $(systemctl is-active plexmediaserver)\e[0m"

echo
echo

banner2 "     F A I L 2 B A N"
bash ./config/fail2ban.sh &> /dev/null
echo
echo -e "$COLOR         Fail2ban is $(systemctl is-enabled fail2ban) and $(systemctl is-active fail2ban)\e[0m"


echo
echo

banner2 "     D O C K E R  S E T U P"
bash ./config/docker.sh &> /dev/null
echo
docker --version && docker-compose --version
echo -e "$COLOR         Docker is $(systemctl is-enabled docker) and $(systemctl is-active docker)\e[0m"

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

banner2 "     P O L I C Y  U P D A T E"
bash ./config/dirpolicy.sh &> /dev/null
echo -e "$COLOR
          - $USER
          - Samba
          - Docker
          - Plex\e[0m"
echo
echo

banner2 "     U F W  C O N F I G"
bash ./config/firewall.sh &> /dev/null
echo
ufw status
echo -e "$COLOR         Firewall is $(systemctl is-enabled ufw)\e[0m"

echo
echo

banner2 "     I N F O"
bash ./config/log.sh &> /dev/null
cp log /home/$USER/log
cat log
banner "           R E A D Y ! ! !"