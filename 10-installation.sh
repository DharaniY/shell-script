#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Please run this script with root acces"
    exit 1 # manually exit the script
else
    echo "Your super user"
fi    
dnf install mysql -y

# $? = to check the status of previous command
# if it is 0 = success
# other than 0 considered the as failure