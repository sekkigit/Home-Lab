# Home Lab installation

# This script will:

   - Turn off hibernate, sleep, and suspend (in case u use a laptop for your server)
   - Create swap partition
   - Update and upgrade ubuntu
   - Create an admin user for the server
   - Create directory tree
   - Menage users
   - Insert your client SSH key and lock SSH
   - Install Cockpit
   - Install Samba
   - Install Plex media server
   - Install Docker, Docker-compose
   - Run Portainer, Nginx Proxy Menager, OpenSpeedTest, Grafana, Prometheus, Node Exporter, and Cadvisor
   - Configure and run UFW (firewall)
   - Install Fail2Ban
   - Display basic info about server

# Script installs: 

   - Cockpit
   - Samba
   - Plex
   - Fail2Ban
   - Docker
   - Docker-compose
   - Nginx Proxy Menager
   - Grafana
   - Prometheus
   - Cadvisor
   - Node Exporter
   - Portainer
   - Homer
   - OpenSpeedTest


# Step one

Download and install Ubuntu Server 20.04 LTS : https://ubuntu.com/download/server


# Step two

Create SSH key on client:
   - ssh-keygen -b 4096
   - cat ~/.ssh/id_rsa.pub
   
Connect to the new host with SSH


# Step three

Enter commands on host:
   - sudo git clone https://github.com/sekkigit/Home-Lab.git init && cd init/
   - sudo nano .var
   - sudo bash install.sh

Edit .var variables, ENTER client SSH key.


# Step four

Visit server dashboard (Homer):
   - port:9055

Cockpit
   - Menage accounts
   - Change configuration options
   - Set time zone (NTP server: time.google.com)

Grafana
   - Open Grafana
   - Add Prometheus for the data base
   - Import dashboard from file or Grafana.com (ID 14282 - node_exporter, ID 1860 - cadvisor)

Portainer
   - Edit environment details: Public IP

Plex
   - Server Setup
   - Add media from /home/USERNAME/fileserver/plexmedia


# Warning

⚠️ Please beware that products can change over time. I do my best to keep up with the latest changes and releases, but please understand that this won’t always be the case.