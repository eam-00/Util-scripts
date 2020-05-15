#!/usr/bin/env bash

## 

REGULAR_USER=''

apt-get install logwatch zile monit mailutils rsnapshot

mkdir -p /var/cache/logwatch
mkdir -p /root/Zile/Backups/
mkdir -p /usr/local/etc/scripts/security/
mkdir -p /home/$REGULAR_USER/Zile/Backups/

cp /etc/logwatch/conf/logwatch.conf /etc/logwatch/conf/logwatch.conf.ORIG

cp /etc/logrotate.conf /etc/logrotate.conf.ORIG
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.ORIG

cd /tmp/

cp .zile /root/
cp .zile $REGULAR_USER/

cp logrotate.conf /etc/logrotate.conf
cp sshd_config /etc/ssh/sshd_config
cp logwatch.conf /etc/logwatch/conf/logwatch.conf
cp reboot-email.sh /home/$REGULAR_USER/Zile/Backups/

chown -R $REGULAR_USER:$REGULAR_USER /home/$REGULAR_USER/Zile/Backups/
chmod 0700 /home/$REGULAR_USER

## EoF ##
