#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]

then
  
    echo "Please switch to the root user"

else

   echo "You are in root"

fi

yum install httpd -y

if [ $? -ne 0 ]

then 
 
    echo "Installation is not successful"
    exit 1 # EXIT STATUS OF THE PREVIOUS COMMAND

else

    echo "Installtion is susccesful"

fi

yum install nginx -y

if [ $? -ne 0 ]

then 
 
    echo "Installation is not successful"
    exit 1 # EXIT STATUS OF THE PREVIOUS COMMAND

else

    echo "Installtion is susccesful"

fi