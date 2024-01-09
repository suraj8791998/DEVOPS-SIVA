#!/bin/bash

LOG_FOLDER=/home/centos/shell-scirpt-log

DATE=$(date +%F)
LOGDIR=/home/centos/deleted-log
LOG_STORE=$LOGDIR-$DATE

FILES_TO_DELETE=$(find $LOG_FOLDER -name "*.log")

echo $FILES_TO_DELETE