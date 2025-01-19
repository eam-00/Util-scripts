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

read -t 10 -p "Enter Month: " MONTH
if [ -z "$MONTH" ]
then 
    echo "The Month cannot be blank."
    echo "Exiting"    
    exit 0 
fi

if [[ "$MONTH" -ge 1 && "$MONTH" -le 12 ]]; then
  echo "You entered $MONTH, which is within the valid range."
else
  echo "Invalid Month. Please enter a number between 1 and 12."
  echo "Exiting"    
  exit 0   
fi

read -p "Enter Day: " DAY
if [ -z "$DAY" ] 
then 
    echo "The Day cannot be blank."
    echo "Exiting"    
    exit 0 
fi

read -p "Enter Hour: " HOUR
if [ -z "$HOUR" ]
then 
    echo "The Hour cannot be blank."
    echo "Exiting"    
    exit 0 
fi

read -p "Enter Minutes: " MINUTES
if [ -z "$MINUTES" ]
then 
    echo "The Minutes cannot be blank."
    echo "Exiting"    
    exit 0 
fi

read -p "Enter Year: " YEAR
if [ -z "$YEAR" ]
then 
    echo "The Year cannot be blank."
    echo "Exiting"    
    exit 0 
fi

$MY_DATE $MONTH$DAY$HOUR$MINUTES$YEAR && $MY_HWCLOCK -w

# EOF #
