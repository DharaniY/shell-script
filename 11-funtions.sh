#!/bin/bash

USERID=$(id -u) # extract username
if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access"
    exit 1 # exit if this condition fails
else
    echo "You are super user"
fi

dnf install mysql -y
echo "is script proccessing?"    