#!/bin/bash

apt install pv
clear
sudo bash init.sh $> sh_log | pv > /dev/null
cat log.txt