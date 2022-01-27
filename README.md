# Home Lab installation

Script installs: 
   - Cockpit
   - Samba
   - Plex
   - Fail2Ban
   - Docker
   - Docker-compose
   - Homer
   - Nginx proxy manager
   - Portainer
   - OpenSpeedTest

# Step one

Link for dovnload Ubuntu Server 20.04 LTS : https://ubuntu.com/download/server

# Step two

Create SSH key for client:
   - sudo ssh-keygen -b 4096
   - cat .ssh/id_rsa.pub

# Step three

Command list:
   - ssh
   - git clone https://github.com/sekkigit/home_lab_installation_bash.git init && cd init/
   - sudo nano .var
   - sudo bash init.sh

# Step four

Server dashboard:
   - port:9055

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
   - Install Docker, Docker-compose, Portainer and OpenSpeedTest, Nginx-proxy-manager
   - Configure and run UFW (firewall)
   - Install Fail2Ban
   - Display basic info about server