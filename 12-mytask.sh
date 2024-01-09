#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]

then 

   echo " ERROR :: Please switch to root user"
   exit 1

fi

VALIDATE() {
     
     if [ $1 -ne 0 ]

     then
   
        echo "Installing $2 is Failure"
    else
        echo "Installing $2 is success"
    fi
}

for i in $@

do

   yum list installed $i
   if [ $? -ne 0 ]

      then 

        echo "Package is not installed"
        yum install $i -y
        VALIDATE $? $1

      else

         echo "Package is already installed"  

    fi

