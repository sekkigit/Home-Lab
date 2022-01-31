# Home Lab installation

Script installs: 
   - Cockpit
   - Samba
   - Plex
   - Fail2Ban
   - Docker
   - Docker-compose
   - Nginx proxy manager
   - Grafana
   - Prometheus
   - Portainer
   - Homer
   - OpenSpeedTest

# Step one

Download and install Ubuntu Server 20.04 LTS : https://ubuntu.com/download/server

# Step two

Create SSH key on client:
   - sudo ssh-keygen -b 4096
   - cat .ssh/id_rsa.pub
   - connect to the new host with SSH

# Step three

Enter commands on host:
   - git clone https://github.com/sekkigit/Home-Lab.git init && cd init/
   - sudo nano .var
   - sudo bash init.sh

Edit .var variables, and ENTER client SSH key.

# Step four

Visit server dashboard (Homer):
   - port:9055

Grafana
   - Open Grafana
   - Add Prometheus for the data base
   - Import dashboard from file or Grafana.com (ID 14282 - node_exporter, ID 1860 - cadvisor)

Nginx proxy manager
   - Login to the web UI of NGINX proxy manager:
      - username: admin@example.com
      - password: changeme

Portainer
   - Edit environment details: Public IP

Cockpit
   - Menage accounts
   - Change configuration options
   - Set time zone

Plex
   - Server Setup
   - Add media from /home/USERNAME/fileserver/plexmedia

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
   - Install Docker, Docker-compose
   - Run Portainer, OpenSpeedTest, Nginx-proxy-manager, Grafana, Prometheus, Node Exporter, and Cadvisor
   - Configure and run UFW (firewall)
   - Install Fail2Ban
   - Display basic info about server