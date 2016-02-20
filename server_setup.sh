#!/bin/bash
# Script to print user information who currently login , current date & time
# Reference: http://stackoverflow.com/questions/13928116/write-a-shell-script-to-ssh-to-a-remote-machine-and-execute-commands
clear
echo "Hello $USER"
echo "Today is \c ";date
echo "Number of user login : \c" ; who | wc -l
echo "Calendar"
cal
end
USERNAME=deployer
HOST=127.0.0.1
SCRIPT="pwd; ls"
OUT="out.txt"
#ssh $USR@$host w > $OUT
ssh -o StrictHostKeyChecking=no -l ${USERNAME} ${HOST} w > "OUT"
exit 0
