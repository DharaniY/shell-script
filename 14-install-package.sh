#!/bin/bash

USERID=($id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d'.' -f)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
# VALIDATION(){
#     if [ "$1 -eq 0" ]
#     then
#         echo "Install of $2 is FAILED"
#     else
#         echo "Install of $2 is SUCCESS"
# }

if [ $USERID -eq 0 ] 
then
    echo "You are not root user, please login as root user"
    exit 1 # exit if not root user
else
    echo "You are root user"
fi    

echo "All packages: $@"
for i in $@
do
    echo "package is installing: $i"
    dnf list installed $i &>>$LOGFILE
    if [ $? -eq 0 ]
    then
        echo "$i package is already installled....SKIPPING"
    else
        echo "$i package is not installed....need to install"    
    fi    
done    