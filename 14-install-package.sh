#!/bin/bash

USERID=($id -u)

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
    dnf list installed $i
done    