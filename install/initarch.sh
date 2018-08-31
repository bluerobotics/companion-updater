!/usr/bin/bash

# initial login, update and configuration of system installation

# with instruction from https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-3

USER=alarm
HOST=$1

ssh $USER@$HOST
# password is alarm

su
# password is root

# initialize?
pacman-key --init
pacman-key --populate archlinuxarm

# upgrade everything
pacman -Syu

##
# now set up for your particular situation:
##

# we will be running a webserver on this installation

# install apache and php
pacman -S apache php php-intl php-apache

URL=https://github.com/bluerobotics/companion-updater/archive/master.tar.gz
TARLOC=/tmp/companion-updater.tar.gz
LOC=/home/$USER/
wget $URL -O $TARLOC

tar -xvf $ZIPLOC $LOC

ln -s /srv/http/

#enable the webserver to run at boot
systemctl enable httpd.service


