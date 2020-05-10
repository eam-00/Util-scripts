#!/usr/bin/env bash

## Send an email upon server reboot
## This script has to be invoked thur a cronjob whern the server reboots

## Multiple destinataries has to be separated by a space
DEST='xxxxxxx@xxxxxxx.net xxxxx@xxxx.com '
HOSTNAME=`/bin/hostname`
MAIL=`which mail`
CAT=`which cat`
MY_MSG='/tmp/server-reboot.msg'
MY_ECHO='/bin/echo -e'
MY_DATE=`/bin/date`

$MY_ECHO "ALERT $HOSTNAME rebooted" > $MY_MSG
$MY_ECHO "$HOSTNAME was rebooted at $MY_DATE" >> $MY_MSG

$CAT $MY_MSG | $MAIL ${DEST} -s "ALERT $HOSTNAME rebooted"

## EoF ##

