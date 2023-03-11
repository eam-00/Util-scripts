#!/usr/bin/env bash

## Switch Workspace Swtich Window Theme

wmctrl -s 3
xfconf-query -c xfwm4 -p /general/theme -s Numix-compact
sw-ws-wm.sh (END)

## EOF ##
