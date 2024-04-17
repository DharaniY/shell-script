#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Please run this script with root acces"
    exit 1 # manually exit the script
else
    echo "Your super user"
fi    
dnf install mysqll -y

if [$? -ne 0]
then
    echo "Installation of mysql failed"
    exit 1 # manually exit the script
fi

dnf install git
# $? = to check the status of previous command
# if it is 0 = success
# other than 0 considered the as failure