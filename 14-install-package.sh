#!/bin/bash

USERID=($id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d'.' -f)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
VALIDATION(){
if [ $1 -ne 0 ]
then
    echo -e "Installation of $2 is $R FAILED $N"
    exit 1 #exit if installation failed
else
    echo -e "Installation of $2 is $G SUCCESSFUL $N"    
}
fi

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
        echo -e "$i package is already installled....$Y SKIPPING $N"
    else
        dnf install -$i -y &>>$LOGFILE
        VALIDATION $? "installation of $i"
        #echo "$i package is not installed....need to install"    
    fi    
done    