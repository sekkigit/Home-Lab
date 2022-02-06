#!/bin/bash

source .var

apt install apache2-utils -y
htpasswd -nb admin $TREAFIKPASS > /var/pass