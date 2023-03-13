#!/usr/bin/env bash
## Switch Workspace Switch Window Theme

# Switch to Virtual Desktop number 4
cmd_wmctrl=$(which wmctrl)
$cmd_wmctrl -s 3
xfconf-query -c xfwm4 -p /general/theme -s Numix-compact

## EOF ##
