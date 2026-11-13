#!/usr/bin/env bash
## XFCE: Switch Your Workspace And Also Switch The Window Manager Theme

cmd_wmctrl=$(which wmctrl)
MY_THEME='Numix-compact'

# Switch to Virtual Desktop number 4
$cmd_wmctrl -s 3

## Set the specified theme
xfconf-query -c xfwm4 -p /general/theme -s $MY_THEME

## EOF ##
