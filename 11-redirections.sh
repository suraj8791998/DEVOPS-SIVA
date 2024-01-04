#!/bin/bash

DATE=$(date +%F)
USERID=$(id -u)
SCRIPT_NAME=$0
LOG_FILE=/tmp/$SCRIPT_NAME-$DATE.log

if [ $USERID -ne 0 ]

then 
 
   echo "Please switch to the root user"

fi

VALIDATE(){

if [ $1 -ne 0]

then

   echo "$2...IS FAILURE"

else

   echo "$2...IS SUCCESS"

}

yum install httpd -y

VALIDATE $? "INSTALLING HTTPD" >>$LOG_FILE

yum install nginx -y

VALIDATE $? "INSTALLING NGINX" >>$LOG_FILE


