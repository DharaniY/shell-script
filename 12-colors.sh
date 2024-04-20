#!/bin/bash

#!/bin/bash

USERID=$(id -u) # extract username
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d'.' -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log 

R="\e[31m"
G="\e[032m"
N="\e[0m"

echo "Script started executing at: $TIMESTAMP"

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
        echo -e "Installation of $2 is $R FAILED $N"
        exit 1 # exit if this condition fails
    else
        echo -e "Installation of $2 is $G SUCCESSFUL $N"    
    fi    
}

dnf install mysql -y &>>$LOGFILE
VALIDATION $? "Install MySQL" 

dnf install git -y &>>$LOGFILE
VALIDATION $? "Install GIT" 

dnf install git1231 -y &>>$LOGFILE
VALIDATION $? "Install GIT1231" 