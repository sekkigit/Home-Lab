#!/bin/bash

source .var

cat <<EOF > /home/$USER/docker/.env
USER="$USER"
SITE="$SITE"
EOF

apt install docker.io -y && apt install docker-compose -y