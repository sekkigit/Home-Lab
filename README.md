# Home Lab installation bash

Get Ubuntu Server 20.04 LTS : https://ubuntu.com/download/server

Bash script for an ubuntu server. It installs all the software needed for my "Home Lab" server (Cockpit, Samba, Plex, Fail2Ban, Docker, and Docker-compose). The server can run a web-based graphical interface, website hosting, file server, stream videos, photos, and audio. Website hosting runs on Nginx, WordPress, and Mysql.

Clone this repository, after cloning you need to edit ".var" (configure variables), and then you need to start "init.sh" (bash script).

Don't forget to enter your SSH key in ".var".

This script will:

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

Command list:
    $ git clone https://github.com/sekkigit/home_lab_installation_bash.git init
    $ cd init/
    $ sudo nano .var
    $ sudo bash init.sh
    $ cat log