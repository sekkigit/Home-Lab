#!/bin/bash

apt install pv
clear
sudo bash init.sh | tee /dev/null | pv > /dev/null
cat log.txt