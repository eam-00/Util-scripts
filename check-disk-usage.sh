#!/usr/bin/env bash

DISK='/dev/mapper/t60p--vg-root'
PERCENTAGE='54'
DF='/bin/df'
MY_TAIL='/usr/bin/tail -1'
AWK='/usr/bin/awk'
TR='/usr/bin/tr'

if [ $($DF --output=pcent $DISK | $MY_TAIL | $AWK '{print $1}' | $TR -cd '0-9\n') -gt $PERCENTAGE ]; then
 echo "Usa mucho espacio de HDD"
else
 echo "No usa mucho espacio de HDD"
fi

## EoF ##
