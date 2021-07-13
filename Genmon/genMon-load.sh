#!/usr/bin/env bash

## genMon-load.sh
## Prints the first value of the CPU load average, also a FontAwesome icon right before the load info
## If the load goes above $LOAD_TRIGGER, changes the color of the font.
## Genmon plugin configuration: Period (s): 28,50

LOAD=$(cat /proc/loadavg | awk '{print $1}')
LOAD_TRIGGER="1.30"

if [ $LOAD \> $LOAD_TRIGGER ]
then
## Adapta fgcolor color and bold font
    echo "<txt><span weight=\"bold\" fgcolor=\"#11eded\">" " |  " $LOAD "</span></txt>"
    echo "<tool>""</tool>"
else
    echo "<txt><span weight=\"bold\">" " |  " $LOAD "</span></txt>"
    echo "<tool>""</tool>"
fi

## EoF ##

