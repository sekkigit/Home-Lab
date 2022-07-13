# Home Lab installation

![alt text](https://sekkigit.github.io/porfolio.sekiteh/img/works/2.jpg)


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
   - Run Portainer, Homer, Nginx Proxy Manager, MariaDB, OpenSpeedTest, Watchtower, Grafana, Prometheus, CrowdSec , Node Exporter, and Cadvisor
   - Configure and run UFW (firewall)
   - Display basic info about server

# Script installs: 

   - Cockpit               > graphical interface to administer servers
   - Samba                 > enables Linux / Unix machines to communicate with Windows machines in a network.
   - Plex                  > find and access all the media 
   - CrowdSec              > analyze behaviors, respond to attacks & share signals across the community
   - Docker                > enables you to separate your applications from your infrastructure
   - Docker-compose        > tool that help define and share multi-container applications
   - Portainer             > self-service container service delivery platform
   - Homer                 > static html/js dashboard, generated from the source in /src using webpack
   - Nginx Proxy Manager   > reverse proxy management system running on Docker
   - MariaDB               > relational databases
   - OpenSpeedTest         > HTML5 Network Performance Estimation Tool
   - Watchtower            > application that monitors your running containers for changes to the image
   - Grafana               > analytics & monitoring solution for every database
   - Prometheus            > scrapes metrics from instrumented jobs
   - Node Exporter         > prometheus exporter for server level and OS level metrics with configurable metric collectors
   - Cadvisor              > provides container users an understanding of the resource usage and performance characteristics of their running containers


# Step one

Download and install Ubuntu Server 20.04 LTS : https://ubuntu.com/download/server


# Step two

Create SSH key on a client:
   ```
    ssh-keygen -b 4096
   ```
   ```
    cat ~/.ssh/id_rsa.pub
   ```

Connect to the new host using SSH


# Step three

Enter commands on host:
   ```
    sudo git clone https://github.com/sekkigit/Home-Lab.git init && cd init/
   ```
   ```
    sudo nano .var
   ```
   ```
    sudo bash install.sh
   ```

Edit .var variables, ENTER client SSH key that you created in step two


# Step four

Visit the dashboard (Homer):
   - port:9055

Cockpit
   - Menage accounts
   - Change configuration options
   - Set time zone (NTP server: time.google.com)

Nginx Proxy Menager
   - Login: admin@example.com / changeme

Grafana
   - Add Prometheus for the data base
   - Import dashboard from file or Grafana.com (ID 14282 - node_exporter, ID 1860 - cadvisor)

Portainer
   - Edit environment details: Public IP

Plex
   - Server Setup
   - Add media from /home/USERNAME/fileserver/plexmedia


# Warning

⚠️ Please beware that products can change over time. I do my best to keep up with the latest changes and releases, but please understand that this won’t always be the case.