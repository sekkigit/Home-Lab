#!/bin/bash

apt install samba -y
bash sambaconfig.sh
service smbd start