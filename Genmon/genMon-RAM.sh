#!/usr/bin/env bash

## genmon-RAM.sh
## Prints the percentage of RAM usage, also a FontAwesome icon right before the information

## No bold text:
## echo "<txt>" "|  " $(free -m | awk 'NR==2{printf "RAM: %s/%sMB %.2f%%\n", $3,$2,$3*100/$2 }'| cut -d " " -f3)"</txt>"

## Adapta fgcolor color and bold font
## echo "<txt><span weight=\"bold\" fgcolor=\"#11eded\">""| " $(free -m | awk 'NR==2{printf "RAM: %s/%sMB %.2f%%\n", $3,$2,$3*100/$2 }'| cut -d " " -f3)"</span></txt>"

## Bold font using the font color provided by the theme:
echo "<txt><span weight=\"bold\">""| " $(free -m | awk 'NR==2{printf "RAM: %s/%sMB %.2f%%\n", $3,$2,$3*100/$2 }'| cut -d " " -f3)"</span></txt>"
echo "<tool>""</tool>"

## EoF ##
