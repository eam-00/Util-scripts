#!/usr/bin/env bash                                                                                                                                            
                                                                                                                                                               
## genMon-date.sh                                                                                                                                              
## Prints the date, using a specific format: "Tuesday 17 Sep 2019",
## also when clicked, it pops a calendar with the current month displayed.
                                                                                                                                                               
echo "<txt>" "|  " $(date +"%A %d %b %Y")"</txt>"                                                                                                              
echo "<tool>""</tool>"                                                                                                                                         
if command -v xterm > /dev/null 2>&1; then                                                                                                                     
echo "<txtclick>"xterm -hold -e /usr/bin/cal"</txtclick>"                                                                                                      
else                                                                                                                                                           
echo "<txtclick>"xfce4-terminal --hold --command=/usr/bin/cal"</txtclick>"                                                                                     
fi                                                                                                                                                             
                                                                                                                                                               
## EoF ##                                                                                                                                                      
