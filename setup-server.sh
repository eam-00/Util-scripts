#!/usr/bin/env bash

## setup-server.sh
## Set things the way it should be on a server.
## Install some stuff, copy config files and set permissions
## REGULAR_USER_00 & REGULAR_USER_01 are the admin user (not root)
## and another plain vanilla users that will take care of things on
## the server

REGULAR_USER_00=''
REGULAR_USER_01=''

MY_APT=$(which apt-get)
MY_USERADD=$(which useradd)
MY_CHOWN=$(which chown)
MY_CHMOD=$(which chmod)
MY_MKDIR=$(which mkdir)

## Without trailing slash [!!!!!]
SETUP_FILES_DIR='/tmp/setup'

## Install programs
$MY_APT install logwatch zile monit mailutils rsnapshot

## Create User & Home Dirs
$MY_USERADD --shell /bin/bash --home /home/$REGULAR_USER_00 $REGULAR_USER_00
$MY_MKDIR /home/$REGULAR_USER_00
$MY_CHOWN -R $REGULAR_USER_00:$REGULAR_USER_00 /home/$REGULAR_USER_00
$MY_CHMOD 0700 /home/$REGULAR_USER_00

$MY_USERADD --shell /bin/bash --home /home/$REGULAR_USER_01 $REGULAR_USER_01
$MY_MKDIR /home/$REGULAR_USER_01
$MY_CHOWN -R $REGULAR_USER_01:$REGULAR_USER_01 /home/$REGULAR_USER_01
$MY_CHMOD 0700 /home/$REGULAR_USER_01

## UGLY! Must fix this!
## chmod +x /home

## Logwatch setup
$MY_MKDIR -p /var/cache/logwatch
if [ -f "/etc/logwatch/conf/logwatch.conf" ]; then
    cp /etc/logwatch/conf/logwatch.conf /etc/logwatch/conf/logwatch.conf.ORIG
fi    
cp $SETUP_FILES_DIR/logwatch.conf /etc/logwatch/conf/logwatch.conf


## Dot Bashrc
if [ -f "/root/.bashrc" ]; then
 cp /root/.bashrc /root/.bashrc.ORIG
fi
 cp $SETUP_FILES_DIR/.bashrc  /root/.bashrc

if [ -f "/$REGULAR_USER_00/.bashrc" ]; then
 cp /home/$REGULAR_USER_00/.bashrc /home/$REGULAR_USER_00/.bashrc.ORIG
fi    
 cp $SETUP_FILES_DIR/.bashrc  /home/$REGULAR_USER_00/.bashrc


## Dot Profile
if [ -f "/root/.profile" ]; then
 cp /root/.profile /root/.profile.ORIG
fi
 cp $SETUP_FILES_DIR/.profile /root/

if [ -f "/home/$REGULAR_USER_00/.profile" ]; then
 cp /home/$REGULAR_USER_00/.profile /home/$REGULAR_USER_00/.profile.ORIG
fi
 cp $SETUP_FILES_DIR/.profile /home/$REGULAR_USER_00/.profile

 
## Zile setup
if command -v zile > /dev/null 2>&1; then
 $MY_MKDIR -p /root/Zile/Backups/
 $MY_MKDIR -p /home/$REGULAR_USER_00/Zile/Backups/
 cp $SETUP_FILES_DIR/.zile /root/
 cp $SETUP_FILES_DIR/.zile /home/$REGULAR_USER_00/
else
 echo "zile is not installed on this server"
fi

## Emacs setup
if command -v emacs > /dev/null 2>&1; then
 $MY_MKDIR -p /root/Emacs/Backups/
 $MY_MKDIR -p /home/$REGULAR_USER_00/Emacs/Backups/
 cp $SETUP_FILES_DIR/.emacs /root/
 cp $SETUP_FILES_DIR/.emacs /home/$REGULAR_USER_00/
else
 echo "Emacs is not installed on this server"
fi

## After Zile and/ or Emacs, .bashrc and .profile setup, set correct owner and permissions
$MY_CHOWN -R REGULAR_USER_00:$REGULAR_USER_00 /home/REGULAR_USER_00/
$MY_CHMOD 0700 /home/REGULAR_USER_00


## Firewall scripts
$MY_MKDIR -p /root/admin/security/
cp  $SETUP_FILES_DIR/firewall.rules.start /root/admin/security/firewall.rules.start
cp  $SETUP_FILES_DIR/firewall.rules.stop  /root/admin/security/firewall.rules.stop


## Email Reboot Notification
$MY_MKDIR -p /usr/local/etc/scripts/security/
cp $SETUP_FILES_DIR/reboot-email.sh /usr/local/etc/scripts/security/
/usr/bin/chmod +x /usr/local/etc/scripts/security/reboot-email.sh


## Disk Usage script for Monit
$MY_MKDIR -p /usr/local/etc/scripts/utils/
cp $SETUP_FILES_DIR/check-disk-usage.sh /usr/local/etc/scripts/utils/
$MY_CHMOD +x /usr/local/etc/scripts/utils/check-disk-usage.sh


## Logrotate
cp /etc/logrotate.conf /etc/logrotate.conf.ORIG
cp $SETUP_FILES_DIR/logrotate.conf /etc/logrotate.conf


## SSHD
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.ORIG
cp $SETUP_FILES_DIR/sshd_config /etc/ssh/sshd_config
cp $SETUP_FILES_DIR/banner /etc/ssh/banner


## Monit
cp /etc/monit/monitrc /etc/monit/monitrc.ORIG
cp $SETUP_FILES_DIR/monitrc /etc/monit/monitrc
cp $SETUP_FILES_DIR/monit.pem /etc/monit/monit.pem


## Rsnapshot
cp /etc/rsnapshot.conf /etc/rsnapshot.conf.ORIG
cp $SETUP_FILES_DIR/rsnapshot.conf /etc/rsnapshot.conf


## Aliases
if [ -f "/etc/aliases" ]; then
 cp /etc/aliases /etc/aliases.ORIG
 cp $SETUP_FILES_DIR/aliases /etc/aliases
fi


## Crontabs - CentOS
if [ -f "/var/spool/cron/root" ]; then
 cp /var/spool/cron/root /root/admin/root.crontab.ORIG
 cp $SETUP_FILES_DIR/root.crontab /var/spool/cron/root 
fi

$MY_CHOWN root:root /var/spool/cron/root

## Crontabs - Debian
if [ -d "/var/spool/cron/crontabs/" ]; then
 cp $SETUP_FILES_DIR/root.crontab /var/spool/cron/crontabs/root 
fi

$MY_CHOWN root:crontab /var/spool/cron/crontabs/root

## cp /etc/apt/apt.conf.d/10periodic /etc/apt/apt.conf.d/_ORIG.10periodic.ORIG
## cp /etc/apt/apt.conf.d/50unattended-upgrades /etc/apt/apt.conf.d/5_ORIG.0unattended-upgrades.ORIG

## EoF ##
