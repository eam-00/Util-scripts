#!/usr/bin/env bash

## setup-server.sh
## Set things the way it should be on a server.
## Install stuff, copy config files and set permissions

REGULAR_USER=''
SETUP_FILES_DIR='/tmp'

## Install programs
/usr/bin/apt-get install logwatch zile monit mailutils rsnapshot

## Logwatch setup
/usr/bin/mkdir -p /var/cache/logwatch
cp /etc/logwatch/conf/logwatch.conf /etc/logwatch/conf/logwatch.conf.ORIG
cp $SETUP_FILES_DIR/logwatch.conf /etc/logwatch/conf/logwatch.conf

## Zile setup
if command -v zile > /dev/null 2>&1; then
 /usr/bin/mkdir -p /root/Zile/Backups/
 /usr/bin/mkdir -p /home/$REGULAR_USER/Zile/Backups/
 cp $SETUP_FILES_DIR/.zile /root/
 cp $SETUP_FILES_DIR/.zile /home/$REGULAR_USER/
else
 echo -e "zile not installed"
fi

## After Zile setup, set correct owner and permissions
/usr/bin/chown -R $REGULAR_USER:$REGULAR_USER /home/$REGULAR_USER/
/usr/bin/chmod 0700 /home/$REGULAR_USER


## Email Reboot Notification
/usr/bin/mkdir -p /usr/local/etc/scripts/security/
cp $SETUP_FILES_DIR/reboot-email.sh /usr/local/etc/scripts/security/
/usr/bin/chmod +x /usr/local/etc/scripts/security/reboot-email.sh

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

## Rsnapshot
cp /etc/rsnapshot.conf /etc/rsnapshot.conf.ORIG
cp $SETUP_FILES_DIR/rsnapshot.conf /etc/rsnapshot.conf

## EoF ##
