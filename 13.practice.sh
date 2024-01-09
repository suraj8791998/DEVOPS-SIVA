#!/bin/bash

USERID=$(id -u)

R="/e[31m"
N="/e[0m"
G="/e[32m"


#CHECKING USER IS ON ROOT OR NOT

if [ $USERID -ne 0 ]

then 

   echo " $R ERROR:: PLEASE SWITCH TO RROT USER $N"

   exit 1
fi

#CHECKING WHETHER PACKAGE IS INSTALLED OR NOT

VALIDATE(){
    if [ $1 -ne 0 ];
    then
        echo "INSTALLING $R $2 IS FAILURE $N"
        exit 1
    else
         echo "INSTALLING $G $2 IS SUCCESS $N"
    fi
}
#INSTALLING PACVKAGES AND CHECKING WHETHER PACKAGE IS ALREADY AVAILABLE
for i in $@
do

  yum list installed $i

  if [ $? -ne 0 ]

  then
    
      echo "$R PACKAGE IS NOT YET INSTALLED $N"
      yum install $i -y
      VALIDATE $? $i

  else

      echo "$G PACKAGE IS ALREADY INSTALLED $N"
    
  fi
done