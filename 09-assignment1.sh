#!/bin/bash

DATE=$(date)

USERID=$(id -u) 

#CHECKING IF THE USER IN ROOT OR NOT
if [ $USERID -ne 0 ]
then
    echo "Please switch to root user"
    exit 1
else
    echo "you are in root"
fi

# CHECKING WHETHER PACKAGE IS AVAILBLE OR NOT
if [ rpm -q maven ]
then
    echo "Mavane package is availble"
    exit 0
else
    echo "Package is not availble, Installe the package"
    yum install maven -y

fi

if [ rpm -q git ]
then
    echo "Mavane package is availble"
    exit 0
else
    echo "Package is not availble, Installe the package"
    yum install git -y

fi
