#!/bin/bash

USERID=$(id -u) # extract username
if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access"
    exit 1 # exit if this condition fails
else
    echo "You are super user"
fi
VALIDATION(){
    if [ $1 -ne 0 ]
    then
        echo "Installation of $2 is failed"
        exit 1 # exit if this condition fails
    else
        echo "Installation of $2 is successful"    
    fi    
}

dnf install mysql -y
VALIDATION $? "Install MySQL" 

dnf install git -y
VALIDATION $? "Install GIT" 

echo "is script proccessing?"    