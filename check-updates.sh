#!/usr/bin/env bash

## check-updates.sh
## Checks for updates on a Debian based Linux server
## and sends an email

DATE='/bin/date'
LOG='/tmp/check-updates.log'
APT_GET='/usr/bin/apt-get'
APT_GET_OPT_1='update'
APT_GET_OPT_2='--download-only --assume-no dist-upgrade'
DEST='xxxxxxxxxxxxxxxx@xxxxxxxxxxxxxxxx.com'
CAT='/bin/cat'
MAIL='/usr/bin/mail'
HOST=`/bin/hostname`

$DATE > $LOG
$APT_GET $APT_GET_OPT_1 >> $LOG
$APT_GET $APT_GET_OPT_2 >> $LOG
$CAT $LOG | $MAIL $DEST -s "Updates for $HOST" 

#/bin/date > /tmp/check-updates.log
#/usr/bin/apt-get update >> /tmp/check-updates.log
#/usr/bin/apt-get --download-only --assume-no dist-upgrade >> /tmp/check-updates.log

#DEST='xxxxxxxxxxxxxxxx@xxxxxxxxxxxxxxxx.com'
#/bin/cat /tmp/check-updates.log | /usr/bin/mail $DEST -s "Updates for www.server.com" 

## EoF ##
