#!/bin/bash

source .var

apt install docker.io -y && apt install docker-compose -y
docker network create proxy
cp ./config/docker-compose.yml /home/$USER/docker/docker-compose.yml

cat <<EOF > /home/$USER/docker/.env
USER=$USER
DNSAPI=$DNSAPI
SITE=$SITE
EOF

cat <<EOF > /home/$USER/docker/nginx/config.json
{
  "database": {
    "engine": "knex-native",
    "knex": {
      "client": "sqlite3",
      "connection": {
        "filename": "/data/database.sqlite"
      },
      "useNullAsDefault": true
    }
  }
}
EOF