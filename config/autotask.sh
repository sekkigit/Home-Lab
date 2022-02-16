#!/bin/bash

source .var

cat <<EOF >> /etc/crontab
$TASKRUN root    apt update && apt upgrade -y
EOF