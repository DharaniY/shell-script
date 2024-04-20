#!/bin/bash

USERID=$(id -u) # extract username
if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access"
    exit 1 # exit if this condition fails
else
    echo "You are super user"
fi

dnf install mysqll -y
if [ $? -ne 0 ]
then
    echo "Installation of mysql failed"
    exit 1 # exit if this condition fails
else
    echo "Installation of mysql successful"    
fi    

dnf install git -y
if [ $? -ne 0 ]
then
    echo "Installation of git failed"
    exit 1 # exit if this condition fails
else
    echo "Installation of git successful"
fi    
echo "is script proccessing?"    