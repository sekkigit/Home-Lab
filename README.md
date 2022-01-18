# Home Lab installation bash

Bash script for an ubuntu server. It installs all the software needed for my "Home Lab" server (Cockpit, Samba, Plex, Fail2Ban, Docker, and Docker-compose). The server can run a web-based graphical interface, website hosting, file server, stream videos, photos, and audio. Website hosting runs on Nginx, WordPress, and Mysql.


Dovnload: Ubuntu Server 20.04 LTS : https://ubuntu.com/download/server

Clone this repository, edit ".var", and start "init.sh".

Create SSH key:
   - sudo ssh-keygen -b 4096
   - cat .ssh/id_rsa.pub

Command list:
   - ssh myusername@0.0.0.0
   - git clone https://github.com/sekkigit/home_lab_installation_bash.git init
   - cd init/
   - sudo nano config/.var
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
   - Install Docker and Docker-compose
   - Clone git repository with docker-compose.yml, .env, and nginx.conf
   - Configure and run UFW (firewall)
   - Display basic info about server software

Docker-compose will run: 
   - Nginx: 1.15.12-alpine
   - WordPress: php7.4-fpm-alpine
   - Msql: 8.0