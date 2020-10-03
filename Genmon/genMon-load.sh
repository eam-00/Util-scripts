#!/usr/bin/env bash

## genMon-load.sh
## Prints the first value of the CPU load average, also a FontAwesome icon right before the load info
## Genmon plugin configuration: Period (s): 28,50

## echo "<txt>" " |  " $(cat /proc/loadavg | awk '{print $1}') "</txt>"

## Adapta fgcolor color and bold font
## echo "<txt><span weight=\"bold\" fgcolor=\"#11eded\">" " |  " $(cat /proc/loadavg | awk '{print $1}') "</span></txt>"

## Bold font using the font color provided by the theme:
echo "<txt><span weight=\"bold\">" " |  " $(cat /proc/loadavg | awk '{print $1}') "</span></txt>"
echo "<tool>""</tool>"

## EoF ##

