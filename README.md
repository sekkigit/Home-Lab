# Home Lab installation bash

This is a bash script for an ubuntu server that automatically installs all the software needed for my "Home Lab" server.

First, you need to edit ".var" (configure variables) then you need to start "init.sh".

This script will:
   - Create an admin user for the server
   - Turn off the laptop lid (in case u use a laptop for your server)
   - Update and upgrade ubuntu
   - Create directories that are needed for all the software
   - Menage users in ubuntu
   - Insert your SSH key
   - Lock SSH
   - Install Cockpit
   - Install Samba (file server)
   - Install Plex media server
   - Install Docker and Docker-compose
   - Clone git repository with docker-compose.yml, .env, and nginx.conf
   - Configure and run UFW (firewall)
   - Display basic info about server software

You must run "docker-compose up" as a new user when the installation is finished.

$ docker-compose -f /home/$USER/docker/docker-compose.yml up -d

(This will run Nginx: 1.15.12-alpine, WordPress: php7.4-fpm-alpine, and Msql: 8.0 in Docker)
