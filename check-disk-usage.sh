#!/usr/bin/env bash

DISK='/dev/mapper/optiplex--755--usfm--vg-root'
PERCENTAGE='94'
DF='/bin/df'
TAIL='/usr/bin/tail'
AWK='/usr/bin/awk'
TR='/usr/bin/tr'

if [ $($DF --output=pcent $DISK | $TAIL -1 | $AWK '{print $1}' | $TR -cd '0-9\n') -gt $PERCENTAGE ]; then
 echo "Usa mucho espacio de HDD"
else
 echo "No usa mucho espacio de HDD"
fi

## EoF ##
