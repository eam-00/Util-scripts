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
if [ -z "$MONTH" ]
then 
    echo "The Month cannot be blank."
    echo "Exiting"    
    exit 0 
fi

read -p "Enter Day: " DAY
if [ -z "$DAY" ] 
then 
    echo "The input cannot be blank."
    echo "Exiting"    
    exit 0 
fi

read -p "Enter Hour: " HOUR
if [ -z "$HOUR" ]
then 
    echo "The input cannot be blank."
    echo "Exiting"    
    exit 0 
fi

read -p "Enter Minutes: " MINUTES
if [ -z "$MINUTES" ]
then 
    echo "The input cannot be blank."
    echo "Exiting"    
    exit 0 
fi

read -p "Enter Year: " YEAR
if [ -z "$YEAR" ]
then 
    echo "The input cannot be blank."
    echo "Exiting"    
    exit 0 
fi

$MY_DATE $MONTH$DAY$HOUR$MINUTES$YEAR && $MY_HWCLOCK -w

# EOF #
