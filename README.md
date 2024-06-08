# Util-scripts

_A couple of miscelaneous and utilitarian Linux server scripts._

## get-sysinfo.sh

Get all sorts of information on a Linux box (Linux, kernel, CPU, RAM, Network, etc, etc.) and save all of that info onto a log file.

## reboot-email.sh

Send an email notification when the server is rebooted.

## check-updates.sh

Issues an apt-get update a day and sends an email with the report

## setup-server.sh

This one sets things up on a server, makes a copy of the original files and then replaces those with pre-edited config files. A work in progress.

## check-disk-usage.sh
Checks a disk or partition and if the usage goes above the PERCENTAGE it prints a warning.  
I use this script executed via [Monit](https://mmonit.com/monit/) to get email warnings when the available drive space reaches the specified threshold.

## check-proc.sh
Checks if a process is running or not.  
Useful with Monit if the monitored process doesn't write a PID.
