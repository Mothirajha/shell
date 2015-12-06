#!/bin/bash
# df | grep ^\/dev.*/\$

HDDSIZE=$(df . | awk '$3 ~ /[0-9]/ { print $5 }' | cut -d '%' -f 1)
NOW=$(date)
MYIP=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')
FREEMEM=$(free -m | head -2 | awk  '$3 ~ /[0-9]/ {print $4}')

if [ $HDDSIZE -lt 90 ]
  then
    echo "One of our server  with ip $MYIP is dramatically using its HDD which is now above 90% (ie. $HDDSIZE), plz take necessary actions." | ssmtp -v rajha12@gmail.com mothirajha.chandramohan@desidime.com
fi

if [ $FREEMEM -lt 512 ]
  then
    echo "One of our server on $NOW with ip $MYIP is dramatically using its Memory which is has memory less than 512MB (ie. $FREEMEM), plz take necessary actions." | ssmtp rajha12@gmail.com mothirajha.chandramohan@desidime.com
fi