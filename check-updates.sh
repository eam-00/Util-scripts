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
CAT=$(which cat)
MAIL=$(which mail)
HOST=`/bin/hostname`

$DATE > $LOG
$APT_GET $APT_GET_OPT_1 >> $LOG
$APT_GET $APT_GET_OPT_2 >> $LOG
$CAT $LOG | $MAIL $DEST -s "Updates for $HOST" 

## EoF ##


