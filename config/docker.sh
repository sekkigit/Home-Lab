#!/bin/bash

source .var

apt install docker.io -y
apt install docker-compose -y

cat <<EOF > /home/$USER/docker/.env
USER="$USER"
SITE="$SITE"
EOF