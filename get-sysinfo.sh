#!/usr/bin/env bash

HOSTNAME=`which hostname`
MY_ECHO="`which echo` -e"
SEPARATOR="`which echo` ----------------------"
MY_CAT=`which cat`
MY_UNAME=`which uname`
MY_FREE=`which free`
MY_DF=`which df`
MY_IFCONFIG=`which ifconfig`
MY_IP=`which ip`
LOG='/tmp/sysinfo.log'


$MY_ECHO "Hostname:" > $LOG
$HOSTNAME >> $LOG
$SEPARATOR >> $LOG

$MY_ECHO >> $LOG

if [ -f "/etc/lsb-release" ]; then
$MY_ECHO "LSB Release:" >> $LOG
$MY_CAT /etc/lsb-release >> $LOG
$SEPARATOR >> $LOG
fi

$MY_ECHO >> $LOG

if [ -f "/etc/os-release" ]; then
$MY_ECHO "OS Release:" >> $LOG
$MY_CAT /etc/os-release >> $LOG
$SEPARATOR >> $LOG
fi

$MY_ECHO >> $LOG

if [ -f "/etc/debian_version" ]; then
$MY_ECHO "Debian Version:" >> $LOG
$MY_CAT /etc/debian_version >> $LOG
$SEPARATOR >> $LOG
fi

$MY_ECHO >> $LOG

$MY_ECHO "Kernel Version:" >> $LOG
$MY_UNAME -a >> $LOG
$MY_ECHO >> $LOG
$SEPARATOR >> $LOG

$MY_ECHO >> $LOG

if [ -f "/proc/cpuinfo" ]; then
$MY_ECHO "CPU Info:" >> $LOG
$MY_CAT /proc/cpuinfo >> $LOG
$MY_ECHO >> $LOG
$SEPARATOR >> $LOG
fi

$MY_ECHO >> $LOG

$MY_ECHO "RAM Info:" >> $LOG
$MY_FREE -m >> $LOG
$MY_ECHO >> $LOG
$SEPARATOR >> $LOG

$MY_ECHO >> $LOG

$MY_ECHO "HDD Space Info:" >> $LOG
$MY_DF -h >> $LOG
$SEPARATOR >> $LOG

if [ -f "/sbin/ifconfig" ]; then
$MY_ECHO "ifconfig Info:" >> $LOG
$MY_IFCONFIG >> $LOG
$SEPARATOR >> $LOG
fi

if [ -f "/usr/bin/ip" ]; then
$MY_ECHO "ip Info:" >> $LOG
$MY_IP a >> $LOG
$SEPARATOR >> $LOG
fi

# cat /etc/network/interfaces >> /tmp/server-info.txt
# netstat -nr >> /tmp/server-info.txt
# Snips from /etc/rsnapshot.conf
# cat /usr/local/etc/scripts/backups/tar-backups.sh >> /tmp/server-info.txt

## EoF ##

