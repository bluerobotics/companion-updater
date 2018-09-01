# Companion Updater

Disk partitions:

- Boot - runs UBoot, The linux bootloader. This is configured to boot the companion installation first, and fall back to the recovery installation if companion fails to boot.
- Recovery - Recovery and update management installation. This (archlinux) installation runs a simple apache webserver with php. The webserver allows uploading a compressed companion installation image, stores it in the staging partition, then extracts it over the existing companion installation
- User (to be implemented) - User data for companion installation - This is for the user's files and configurations. This partition will not be affected during the recovery/update process, thus the user's files are persistent during updates.
- Staging (to be implemented) filesystem to store compressed image to be burned
- Companion (filesystem to run the companion installation)

To copy an sd card:



# conf contains files to configure and run the webserver
# these files are located according where they should be installed (copied) on the root filesystem

# install contains scripts to install the system


## Setup/Installation (wip, not complete)
1. run makearch.sh <disk>
2. put the sd card in the pi, connect it to a monitor and a keyboard (and your router if you want)
3. hold the spacebar down while the pi boots
4. at the uboot command line enter setenv brpart <partition # to boot>
4. at the uboot command line enter run bootcmd
4. done!
4. more steps to come... (this can probably be done easier using chroot)
3. ssh to the pi user alarm password alarm or use root/root
4. move the initarch.sh from here to the pi
4. run the initarch.sh on the pi
4. Move files from conf here to / on the pi
4. reboot or systemctl restart httpd
4. visit pi ip address in browser to see webpage



# Reference

1. https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-3
2. http://randombio.com/linuxsetup107.html

# Going further

Ways in which we may want to expand the funcionality provided here

1. uboot netconsole
2. watchdog
3. fallback support
4. network booting

# Use this to back up an SD card

# Create diskimage IMG of the disk DISK (eg. /dev/sdg careful!)
```
$ sudo bash ./copyarch.sh DISK IMG
```


#Things I've tried

$ p1 boot p2 arch p3 companion part
results: companion part give error
```
/sbin/init does not exist
bailing out, you are on your own
```


p1 boot p2 arch p3 arch (UUIDS were the same)
boot in p3:
results: success!

remove uuid=3 from boot.txt
results:

```
ERROR=device'PARTUUID=' not found. skipping fsck.
```
then i get logged into rootfs




```
sudo bash ./prepare-disk.sh /dev/sdh 2G 2G
```



