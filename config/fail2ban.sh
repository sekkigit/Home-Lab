#!/bin/bash

apt install fail2ban -y
systemctl enable fail2ban
systemctl start fail2ban