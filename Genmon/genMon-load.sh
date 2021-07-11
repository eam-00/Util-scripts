#!/usr/bin/env bash

## genMon-load.sh
## Prints the first value of the CPU load average, also a FontAwesome icon right before the load info
## Genmon plugin configuration: Period (s): 28,50

LOAD=$(cat /proc/loadavg | awk '{print $1}')
if [ $LOAD \> 1.10 ]
then
## Adapta fgcolor color and bold font
    echo "<txt><span weight=\"bold\" fgcolor=\"#11eded\">" " |  " $LOAD "</span></txt>"
    echo "<tool>""</tool>"
else
    echo "<txt><span weight=\"bold\">" " |  " $LOAD "</span></txt>"
    echo "<tool>""</tool>"
fi

## EoF ##

