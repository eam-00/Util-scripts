#!/usr/bin/env bash

## genMon-bsas-weather.sh
## Prints the weather in Bs As, taken from wttr.in, via cronjob, stored on $LOG
## This script uses the output from the execution of the script:
## ~/Local/Scripts/genmon/get-bsas-weather.sh

CAT="/bin/cat"
LOG="/tmp/aep.tmp"
WTTR_ERROR="Unknown location; please try ~-34.5592566,-58.4146741723315"
GREP="/usr/bin/grep"
CUT="/usr/bin/cut"

## Eval the LOG contents in case there are problems with wttr.in
if [ cat /tmp/aep.tmp = $WTTR_ERROR ]
 then echo "No Value" > /tmp/LOG_ERROR
  echo "<txt>" "|  " $($CAT /tmp/LOG_ERROR)"</txt>"
  echo "<tool>""</tool>"
 else

## With the weather condition glyph:
## cat /tmp/aep.tmp | grep -e 'Weather:' | cut -d' ' -f2-

## Without the weather condition glyph:
## cat /tmp/aep.tmp | grep -e 'Weather:' | cut -d' ' -f3-
## $CAT $LOG | $GREP -e 'Weather:' | $CUT -d' ' -f3-

## Adapta colored:
## echo "<txt><span weight=\"bold\" fgcolor=\"#11eded\">" "|  " $($CAT $LOG | $GREP -e 'Weather:' | $CUT -d' ' -f3-)"</span></txt>"

## No color, bold font:
## echo "<txt><span weight=\"bold\">" "|  " $($CAT $LOG | $GREP -e 'Weather:' | $CUT -d' ' -f3-)"</span></txt>"

## The one to be used with the SHORT_FORMAT
echo "<txt>" "|  " $($CAT $LOG)"</txt>"

echo "<tool>""</tool>"
fi

## EoF ##
