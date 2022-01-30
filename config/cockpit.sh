#!/bin/bash

apt install cockpit -y
bash network.sh
netplan apply && service cockpit start