# Home Lab installation

Script installs software: 
   - Cockpit
   - Samba
   - Plex
   - Fail2Ban
   - Docker
   - Docker-compose
   - Portainer
   - OpenSpeedTest

Link for dovnload Ubuntu Server 20.04 LTS : https://ubuntu.com/download/server

Clone this repository, edit ".var", and start "init.sh".

Create SSH key for client:
   - sudo ssh-keygen -b 4096
   - cat .ssh/id_rsa.pub

Command list:
   - ssh
   - git clone https://github.com/sekkigit/home_lab_installation_bash.git init && cd init/
   - sudo nano .var
   - sudo bash init.sh

# This script will:

   - Turn off hibernate, sleep, and suspend (in case u use a laptop for your server)
   - Create swap partition
   - Update and upgrade ubuntu
   - Create an admin user for the server
   - Create directory tree
   - Menage users
   - Insert your client SSH key
   - Lock SSH
   - Install Cockpit
   - Install Samba
   - Install Plex media server
   - Install Docker, Docker-compose, Portainer and OpenSpeedTest
   - Configure and run UFW (firewall)
   - Install Fail2Ban
   - Display basic info about server