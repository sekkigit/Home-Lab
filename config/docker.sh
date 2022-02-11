#!/bin/bash

source .var

apt install docker.io -y && apt install docker-compose -y
docker network create proxy
cp ./config/docker-compose.yml /home/$USER/docker/docker-compose.yml

cat <<EOF > /home/$USER/docker/.env
USER=${USER}
DNSAPI=${DNSAPI}
SITE=${SITE}
EOF