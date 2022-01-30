#!/bin/bash

source .var

mkdir /home/$USER/{.ssh,$SAMBA,docker}
mkdir /home/$USER/$SAMBA/{public_files,$PLEX}
mkdir /home/$USER/$SAMBA/$PLEX/{movies,series,cartoons,anime,photos,homevideo,music}
mkdir /home/$USER/docker/homer
mkdir /etc/prometheus