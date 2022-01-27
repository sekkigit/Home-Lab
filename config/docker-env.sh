#!/bin/bash

source .var

cat <<EOF > /home/$USER/docker/.env
USER=$USER
EOF