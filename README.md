# Home Lab installation bash

This is a bash script for an ubuntu server that automatically installs all the software needed for my "Home Lab" server.

This script will:
   - Create an admin user for the server
   - Turn off the laptop lid (in case u use a laptop for your server)
   - Update and upgrade ubuntu
   - Create directories that are needed for all the software
   - Menage users in ubuntu
   - Insert your ssh key
   - Install Cockpit
   - Install Plex media server
   - Install Samba (file server)
   - Install Docker and Docker-compose
   - Clone git repository with docker-compose.yml, .env, and nginx.conf
   - Configure and run UFW (firewall)
   - Display basic info about server software

You need to run this command when installation is finished.
# sudo docker-compose -f /home/"user name"/docker/docker-compose.yml up -d
(This command will run Nginx: 1.15.12-alpine, WordPress: php7.4-fpm-alpine, and Msql: 8.0 in Docker)
Edit /home/$USER/.env fore safety.
