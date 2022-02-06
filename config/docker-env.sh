#!/bin/bash

source .var

cat <<EOF > /home/$USER/docker/.env
USER="$USER"
SITE="$SITE"
EOF