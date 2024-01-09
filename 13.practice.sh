#!/bin/bash

USERID=$(id -u)
$DATE=$(date +%F)
LOGDIR=/home/centos/shell-scirpt-log
LOGFILE=$LOGDIR/$0.$DATE.log

#CHECKING USER IS ON ROOT OR NOT

if [ $USERID -ne 0 ]

then 

   echo  "ERROR:: PLEASE SWITCH TO RROT USER "

   exit 1
fi

#CHECKING WHETHER PACKAGE IS INSTALLED OR NOT

VALIDATE(){
    if [ $1 -ne 0 ];
    then
        echo "INSTALLING  $2 IS FAILURE"
        exit 1
    else
         echo "INSTALLING $2 IS SUCCESS"
    fi
}
#INSTALLING PACVKAGES AND CHECKING WHETHER PACKAGE IS ALREADY AVAILABLE
for i in $@
do

  yum list installed $i &>>$LOGFILE

  if [ $? -ne 0 ]

  then
    
     echo  " PACKAGE IS NOT YET INSTALLED "
      yum install $i -y &>>$LOGFILE
      VALIDATE $? $i

  else

      echo " PACKAGE IS ALREADY INSTALLED"
    
  fi
done