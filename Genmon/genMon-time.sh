#!/usr/bin/env bash

## genMon-time.sh
## Prints the time, using a specific format: "17:23"
## There is a special character that prints a FontAwesome Clock right in front of the hour.
## FontAwesome Cheat Sheet: https://fontawesome.com/cheatsheet

echo "<txt>" "| " $(date +"%H:%M")"</txt>"
echo "<tool>""</tool>"

## EoF ##
