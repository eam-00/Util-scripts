#!/usr/bin/env bash                                                                                                                                            
                                                                                                                                                               
## genMon-date.sh                                                                                                                                              
## Prints the date, using a specific format: "Tuesday 17 Sep 2019"                                                                                             
                                                                                                                                                               
echo "<txt>" "|  " $(date +"%A %d %b %Y")"</txt>"                                                                                                              
echo "<tool>""</tool>"                                                                                                                                         
## echo "<txtclick>"xterm -hold -e /usr/bin/cal"</txtclick>"                                                                                                   
echo "<txtclick>"xfce4-terminal --hold --command=/usr/bin/cal"</txtclick>"                                                                                     
                                                                                                                                                               
## EoF ##                                                                                                                                                      
