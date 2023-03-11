#!/usr/bin/env bash
## Switch Workspace Switch Window Theme

wmctrl -s 3
xfconf-query -c xfwm4 -p /general/theme -s Numix-compact

## EOF ##
