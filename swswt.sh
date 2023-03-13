#!/usr/bin/env bash
## Switch Workspace Switch Window Theme

cmd_wmctrl=$(which wmctrl)

# Switch to Virtual Desktop number 4
$cmd_wmctrl -s 3
xfconf-query -c xfwm4 -p /general/theme -s Numix-compact

## EOF ##
