#!/bin/bash

source .var

apt install docker.io -y && apt install docker-compose -y
docker network create proxy
cp ./config/docker-compose.yml /home/$USER/docker/docker-compose.yml

cat <<EOF > /home/$USER/docker/.env
USER=${USER}
PUID=${PUID}
PGID=${PGID}
TIMEZONE=${TIMEZONE}
IP=${IP}
DNSAPI=${DNSAPI}
SITE=${SITE}
NETADAPT=${NETADAPT}
ROOT_PASSWORD=${ROOT_PASSWORD}
MYSQL_DATABASE=${MYSQL_DATABASE}
MYSQL_USER=${MYSQL_USER}
MYSQL_PASSWORD=${MYSQL_PASSWORD}
EOF

setfacl -m "u:root:rw" /home/$USER/docker/.env