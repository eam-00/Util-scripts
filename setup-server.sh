#!/usr/bin/env bash

## 

REGULAR_USER=''
SETUP_FILES_DIR=''

apt-get install logwatch zile monit mailutils rsnapshot

## Logwatch
/usr/bin/mkdir -p /var/cache/logwatch
cp /etc/logwatch/conf/logwatch.conf /etc/logwatch/conf/logwatch.conf.ORIG
cp /$SETUP_FILES_DIR/logwatch.conf /etc/logwatch/conf/logwatch.conf


/usr/bin/mkdir -p /root/Zile/Backups/
/usr/bin/mkdir -p /home/$REGULAR_USER/Zile/Backups/
cp /$SETUP_FILES_DIR/.zile /root/
cp /$SETUP_FILES_DIR/.zile /home/$REGULAR_USER/

## After Zile setup, set correct owner and permissions
/usr/bin/chown -R $REGULAR_USER:$REGULAR_USER /home/$REGULAR_USER/
/usr/bin/chmod 0700 /home/$REGULAR_USER


/usr/bin/mkdir -p /usr/local/etc/scripts/security/

cp /etc/logrotate.conf /etc/logrotate.conf.ORIG
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.ORIG

cp /$SETUP_FILES_DIR/logrotate.conf /etc/logrotate.conf
cp /$SETUP_FILES_DIR/sshd_config /etc/ssh/sshd_config

cp /$SETUP_FILES_DIR/reboot-email.sh /home/$REGULAR_USER/Zile/Backups/


## EoF ##
