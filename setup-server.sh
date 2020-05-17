#!/usr/bin/env bash

## 

REGULAR_USER=''

apt-get install logwatch zile monit mailutils rsnapshot

/usr/bin/chown -R $REGULAR_USER:$REGULAR_USER /home/$REGULAR_USER/
/usr/bin/chmod 0700 /home/$REGULAR_USER


## Logwatch
/usr/bin/mkdir -p /var/cache/logwatch
cp /etc/logwatch/conf/logwatch.conf /etc/logwatch/conf/logwatch.conf.ORIG
cp /tmp/setup-server/logwatch.conf /etc/logwatch/conf/logwatch.conf


/usr/bin/mkdir -p /root/Zile/Backups/
/usr/bin/mkdir -p /home/$REGULAR_USER/Zile/Backups/
cp /tmp/.zile /root/
cp /tmp/.zile /home/$REGULAR_USER/

/usr/bin/mkdir -p /usr/local/etc/scripts/security/

cp /etc/logrotate.conf /etc/logrotate.conf.ORIG
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.ORIG

cp logrotate.conf /etc/logrotate.conf
cp sshd_config /etc/ssh/sshd_config

cp reboot-email.sh /home/$REGULAR_USER/Zile/Backups/


## EoF ##
