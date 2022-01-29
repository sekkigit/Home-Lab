#!/bin/bash

apt install pv && clear
sudo bash init.sh &> /dev/null | pv > /dev/null
cat log.txt