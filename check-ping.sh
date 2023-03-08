#!/usr/bin/env bash

hosts="${1}"
cmd_ping=$(which ping)


# Clear the screen
clear


# Check if the ARG is present
if [ -z "${1}" ]; then
        echo
        echo -e "You must provide the host/s [ARG1]"
        echo
        echo "Usage:"
        echo -e "\t$0 \"hostname1\""
        echo -e "\t\tor "
        echo -e "\t$0 \"hostname1\" \"hostname2\" \"hostname3\" ...\""
        echo
        exit
fi


# Print one dividing line.
echo "----------------------------"


# Main
for host in ${hosts}; do
        # Ping the hosts
        $cmd_ping -c10 $host &>/dev/null
        if [ $? -eq 0 ]; then
                echo "Status for ${host}: UP" 



        else
                echo "$host: DOWN"
        fi
        echo "----------------------------"
done

# EOF #
