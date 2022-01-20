# Home Lab installation bash

Bash script for an ubuntu server. It installs all the software needed for my "Home Lab" server. 
Cockpit, Samba, Plex, Fail2Ban, Portainer, Docker, and Docker-compose


Dovnload: Ubuntu Server 20.04 LTS : https://ubuntu.com/download/server

Clone this repository, edit ".var", and start "init.sh".

Create SSH key:
   - sudo ssh-keygen -b 4096
   - cat .ssh/id_rsa.pub

Command list:
   - ssh myusername@0.0.0.0
   - git clone https://github.com/sekkigit/home_lab_installation_bash.git init
   - cd init/
   - sudo nano .var
   - sudo bash init.sh

# This script will:

   - Create an admin user for the server
   - Turn off the laptop lid, hibernate, sleep, and suspend (in case u use a laptop for your server)
   - Update and upgrade ubuntu
   - Create directories that are needed
   - Menage users in ubuntu
   - Insert your SSH key
   - Lock SSH
   - Install Fail2Ban
   - Install Cockpit
   - Install Samba (file server)
   - Install Plex media server
   - Install Docker, Docker-compose and Portainer
   - Clone git repository with docker-compose.yml, .env, and nginx.conf
   - Configure and run UFW (firewall)
   - Display basic info about server software