#!/usr/bin/env bash

cat /sys/class/thermal/thermal_zone0/temp > /tmp/cpu_temp
echo "<txt><span weight=\"bold\">"" | "$((`cat /tmp/cpu_temp`/1000))"°""</span></txt>"
echo "<tool>""</tool>"

## EoF ##
