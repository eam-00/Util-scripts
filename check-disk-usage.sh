#!/usr/bin/env bash

DISK='/dev/mapper/optiplex--755--usfm--vg-root'
PERCENTAGE='94'
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
