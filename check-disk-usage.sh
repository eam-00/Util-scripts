#!/usr/bin/env bash

## check-disk-usage.sh
## Checks a disk or partition and if the usage goes above the
## PERCENTAGE it prints a warning.
## Used to make checks via [Monit](https://github.com/eam-00/Monit/tree/master) 

DISK='/dev/mapper/t60p--vg-root'
PERCENTAGE='56'
MY_DF='/bin/df --output=pcent'
MY_TAIL='/usr/bin/tail -1'
MY_AWK=$(which awk)
MY_TR='/usr/bin/tr -cd '0-9\n''

if [ $($MY_DF $DISK | $MY_TAIL | $MY_AWK '{print $1}' | $MY_TR) -gt $PERCENTAGE ]; then
 echo "Root Partition: Check Available Disk Space"
 exit 1
else
 echo "Root Partition: Available Disk Space Is OK"
 exit 0
fi

## EoF ##
