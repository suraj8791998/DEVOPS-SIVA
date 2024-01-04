#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]

then 
   
     echo "please witch to the root user"

fi

VALIDATE(){

 if [ $1 -ne 0 ]

 then
   echo " $2..IS FAILURE"
 
 else
   echo "$2...IS SUCCESS"
fi
}

yum install httpd -y

VALIDATE $? Installing HTTPD

yum install nginx -y

VALIDATE $? Installing NGINX
