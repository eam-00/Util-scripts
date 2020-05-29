#!/usr/bin/env bash

## genmon-RAM.sh
## Prints the percentage of RAM usage, also a FontAwesome icon right before the information

echo "<txt>" "|  " $(free -m | awk 'NR==2{printf "RAM: %s/%sMB %.2f%%\n", $3,$2,$3*100/$2 }'| cut -d " " -f3)"</txt>"
echo "<tool>""</tool>"

## EoF ##
