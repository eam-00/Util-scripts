#!/usr/bin/env bash

## get-sysinfo.sh
## Gather information on Linux box (Debian/ Ubuntu centric)
## and save that info onto a log file

HOSTNAME=`which hostname`
MY_ECHO="`which echo` -e"
SEPARATOR="`which echo` ----------------------"
MY_CAT=`which cat`
MY_UNAME=`which uname`
MY_FREE=`which free`
MY_DF=`which df`
MY_IFCONFIG='/sbin/ifconfig'
MY_IP='/usr/bin/ip'
MY_NETSTAT='/bin/netstat'
LOG='/tmp/sysinfo.log'


$MY_ECHO "Hostname:" > $LOG
$HOSTNAME >> $LOG
$SEPARATOR >> $LOG

$MY_ECHO >> $LOG

if [ -f "/etc/lsb-release" ]; then
 $MY_ECHO "LSB Release:" >> $LOG
 $MY_CAT /etc/lsb-release >> $LOG
 $MY_ECHO >> $LOG
 $SEPARATOR >> $LOG
fi

$MY_ECHO >> $LOG

if [ -f "/etc/os-release" ]; then
 $MY_ECHO "OS Release:" >> $LOG
 $MY_CAT /etc/os-release >> $LOG
 $MY_ECHO >> $LOG
 $SEPARATOR >> $LOG
fi

$MY_ECHO >> $LOG

if [ -f "/etc/debian_version" ]; then
 $MY_ECHO "Debian Version:" >> $LOG
 $MY_CAT /etc/debian_version >> $LOG
 $MY_ECHO >> $LOG
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
$MY_ECHO >> $LOG
$SEPARATOR >> $LOG

if command -v $MY_IFCONFIG > /dev/null 2>&1; then
 $MY_ECHO >> $LOG
 $MY_ECHO "$MY_IFCONFIG Info:" >> $LOG
 $MY_IFCONFIG >> $LOG
else
 $MY_ECHO >> $LOG
 $MY_ECHO "$MY_IFCONFIG is not available" >> $LOG
 $MY_ECHO >> $LOG
fi

$SEPARATOR >> $LOG

if command -v $MY_IP > /dev/null 2>&1; then
 $MY_ECHO >> $LOG
 $MY_ECHO "$MY_IP Info:" >> $LOG
 $MY_IP a >> $LOG
 $SEPARATOR >> $LOG
 $MY_ECHO >> $LOG
 $MY_ECHO "$MY_IP Routing Info:" >> $LOG
 $MY_IP route >> $LOG
 $MY_ECHO >> $LOG
else
 $MY_ECHO >> $LOG
 $MY_ECHO "$MY_IP is not available" >> $LOG
 $MY_ECHO >> $LOG
fi

$SEPARATOR >> $LOG

if [ -f "/etc/network/interfaces" ]; then
 $MY_ECHO >> $LOG
 $MY_ECHO "Network Interfaces Info:" >> $LOG
 $MY_CAT /etc/network/interfaces >> $LOG
 $MY_ECHO >> $LOG
 $SEPARATOR >> $LOG
fi

if [ -f "/etc/netplan/rackspace-cloud.yaml" ]; then
 $MY_ECHO >> $LOG
 $MY_ECHO "Netplan Info:" >> $LOG
 $MY_CAT /etc/netplan/rackspace-cloud.yaml >> $LOG
 $MY_ECHO >> $LOG
 $SEPARATOR >> $LOG
fi

if command -v $MY_NETSTAT > /dev/null 2>&1; then
 $MY_ECHO >> $LOG
 $MY_ECHO "$MY_NETSTAT Routing Info:" >> $LOG
 $MY_NETSTAT -nr >> $LOG
 $MY_ECHO >> $LOG
else
 $MY_ECHO >> $LOG
 $MY_ECHO "$MY_NETSTAT is not available" >> $LOG
 $MY_ECHO >> $LOG
fi

$SEPARATOR >> $LOG

# Snips from /etc/rsnapshot.conf
# cat /usr/local/etc/scripts/backups/tar-backups.sh >> /tmp/server-info.txt

## EoF ##

