#!/bin/bash

apt install pv && clear
sudo bash init.sh &> /dev/null | pv > sh_log
cat log.txt