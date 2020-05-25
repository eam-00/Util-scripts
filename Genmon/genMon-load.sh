!/usr/bin/env bash

## genMon-load.sh
## Prints the first value of the CPU load average, also a FontAwesome icon right before the load info

echo "<txt>" " |  " $(cat /proc/loadavg | awk '{print $1}') "</txt>"
echo "<tool>""</tool>"

## EoF ##
