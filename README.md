To copy an sd card:

# Create diskimage IMG of the disk DISK (eg. /dev/sdg careful!)
```
$ sudo -u $USER bash ./copyarch.sh DISK IMG
```

# conf contains files to configure and run the webserver
# these files are located according where they should be installed (copied) on the root filesystem

# install contains scripts to install the system

1. run makearch.sh
2. put the sd card in the pi, connect it to your router
3. ssh to the pi user alarm password alarm or use root/root
4. visit pi ip address in browser to see webpage

