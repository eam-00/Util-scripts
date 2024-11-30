#!/usr/bin/env bash

echo -e "Current fan speed:"
echo
cat /sys/devices/platform/applesmc.768/fan1_min
echo
echo

read -p "Enter the fan speed: " FAN_SPEED

echo ${FAN_SPEED} > /sys/devices/platform/applesmc.768/fan1_min

# EOF #
