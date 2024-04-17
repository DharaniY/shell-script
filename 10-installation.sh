#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Please run this script with root acces"
else
    echo "Your super user"
fi    
dnf install mysql -y