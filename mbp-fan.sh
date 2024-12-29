#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]
  then
       echo "This script needs to be executed as root or via sudo."
       echo "Exiting"
  exit
fi

echo -e "Current fan speed:"
echo
cat /sys/devices/platform/applesmc.768/fan1_min
echo
echo

read -p "Enter the fan speed: " FAN_SPEED

echo ${FAN_SPEED} > /sys/devices/platform/applesmc.768/fan1_min

# EOF #
