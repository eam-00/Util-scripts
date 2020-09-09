#!/usr/bin/env bash
## genMon-date.sh
## Prints the date, using a specific format: "Tuesday 17 Sep 2019",
## also when clicked, it pops a calendar with the current month displayed.

## Bold font
echo "<txt><span weight=\"bold\">" "|  "  $(date +"%A %d %b %Y")"</span></txt>"
## No mouse over tool tip
echo "<tool>""</tool>"

if command -v xterm > /dev/null 2>&1; then
echo "<txtclick>"xterm -hold -e /usr/bin/cal"</txtclick>"
else
echo "<txtclick>"xfce4-terminal --hold --command=/usr/bin/cal"</txtclick>"
fi

## EoF ##
