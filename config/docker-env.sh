#!/bin/bash

source .var

cat <<EOF > /home/$USER/docker/.env
USER=$USER
WEB=$WEB
EMAIL=$EMAIL
EOF