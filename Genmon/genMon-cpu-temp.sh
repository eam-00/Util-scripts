#!/usr/bin/env bash

cat /sys/class/thermal/thermal_zone0/temp > /tmp/cpu_temp
## echo $((`cat /tmp/cpu_temp`/1000))"°"
echo "<txt>"" | "$((`cat /tmp/cpu_temp`/1000))"°""</txt>"
echo "<tool>""</tool>"

## EoF ##
