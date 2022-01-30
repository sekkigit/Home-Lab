#!/bin/bash

curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -
echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list

apt update
echo y | apt install plexmediaserver -y

bash plexufw.sh

service plexmediaserver start