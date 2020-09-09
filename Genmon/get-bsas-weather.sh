#!/usr/bin/env bash

## Pulls weather information for Aeroparque, Buenos Aires, from wttr.in
## via a cronjob

## More info on WTTR.in: https://github.com/chubin/wttr.in

WGET='/usr/bin/wget -q -O-'
FULL_FORMAT='http://v2.wttr.in/aep'
SHORT_FORMAT='http://v2.wttr.in/aep?format=3'
LOG='/tmp/aep.tmp'

## Full format (lots of information):
$WGET $FULL_FORMAT > $LOG

## Short format:
## If you use this format, be sure to edit the file $HOME/Local/Scripts/genmon/genMon-bsas-weather.sh
## $WGET $SHORT_FORMAT > $LOG

#############
## Cronjob ##
#############
## @reboot /bin/bash $HOME/Local/Scripts/genmon/get-bsas-weather.sh
## */19 * * * * /bin/bash $HOME/Local/Scripts/genmon/get-bsas-weather.sh

## EoF ##
