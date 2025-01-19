#!/usr/bin/env bash
# set_date_time.sh

if [ "$EUID" -ne 0 ]
  then
       echo "This script needs to be executed as root or via sudo."
       echo "Exiting"
  exit
fi

MY_DATE=$(which date)
MY_HWCLOCK=$(which hwclock)

read -p "Enter Month: " MONTH
read -p "Enter Day: " DAY
read -p "Enter Hour: " HOUR
read -p "Enter Minutes: " MINUTES
read -p "Enter Year: " YEAR

if [ -z "$MONTH" ] || [ -z "$DAY" ] || [ -z "$HOUR" ] || [ -z "$MINUTES" ] || [ -z "$YEAR" ]
then 
    echo "The input cannot be blank."
    echo "Exiting"    
    exit 0 
fi

$MY_DATE $MONTH$DAY$HOUR$MINUTES$YEAR && $MY_HWCLOCK -w

# EOF #
