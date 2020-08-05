#!/usr/bin/env bash

DISK='/dev/mapper/t60p--vg-root'
PERCENTAGE='54'
MY_DF='/bin/df --output=pcent'
MY_TAIL='/usr/bin/tail -1'
AWK='/usr/bin/awk'
MY_TR='/usr/bin/tr -cd '0-9\n''

if [ $($MY_DF $DISK | $MY_TAIL | $AWK '{print $1}' | $MY_TR) -gt $PERCENTAGE ]; then
 echo "Usa mucho espacio de HDD"
 exit 1
else
 echo "No usa mucho espacio de HDD"
 exit 0
fi

## EoF ##
