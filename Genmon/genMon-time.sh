#!/usr/bin/env bash

## genMon-time.sh
## Prints the time, using a specific format: "17:23"
## There is a special character that prints a FontAwesome Clock right in front of the hour.
## FontAwesome Cheat Sheet: https://fontawesome.com/cheatsheet
## Genmon plugin configuration: Period (s): 30,00

## echo "<txt>" "| " $(date +"%H:%M")"</txt>"

## An Adapta color of sorts
## echo "<txt><span weight=\"bold\" fgcolor=\"#11eded\">" "|  " $(date +"%H:%M")"</span></txt>"

## No color (uses the one defined by the theme) & bold font:
echo "<txt><span weight=\"bold\">" "|  " $(date +"%H:%M")"</span></txt>"
echo "<tool>""</tool>"

## EoF ##
