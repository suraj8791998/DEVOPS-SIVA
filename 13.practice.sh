#!/bin/bash

USERID=$(id -u)

#CHECKING USER IS ON ROOT OR NOT

if [ $USERID -ne 0 ]

then 

   echo "ERROR:: PLEASE SWITCH TO RROT USER"

   exit 1
fi

#CHECKING WHETHER PACKAGE IS INSTALLED OR NOT
VALIDATE(){

    if [ $? -ne 0 ]

    then
       echo "INSTALLING $2 IS FAILURE"

    else
       echo "INSTALLING $2 IS SUCCESS"
}
#INSTALLING PACVKAGES AND CHECKING WHETHER PACKAGE IS ALREADY AVAILABLE
for i in $@
do

  yum list installed $i

  if [ $? -ne 0 ]

  then
    
      echo "PACKAGE IS NOT YET INSTALLED"
      yum install $i -y
      VALIDATE $? $i

  else

      echo "PACKAGE IS ALREADY INSTALLED"
    
  fi
