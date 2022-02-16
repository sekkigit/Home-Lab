#!/bin/bash

source .var

cat <<EOF >> /etc/crontab
$TASKRUN root    apt update && apt upgrade -y
$TASKRUN root    cscli hub update && cscli collections upgrade crowdsecurity/sshd && systemctl reload crowdsec
EOF