!/usr/bin/bash

# initial login, update and configuration of system installation

# with instruction from https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-3

ssh alarm@$1
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

# install apache
pacman -S apache

#enable the webserver to run at boot
#systemctl enable httpd.service


