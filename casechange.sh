#!/bin/bash

#Script to rename the files and folders to upper or lower case
list="`ls -I casechange.sh`" #Exclude the script alone

if [ "$1" == "lower" ];then
    for f in $list; do mv -v "$f" "`echo $f | tr '[A-Z]' '[a-z]'`"; done

elif [ "$1" == "upper" ];then
    for f in $list; do mv -v "$f" "`echo $f | tr '[a-z]' '[A-Z]'`"; done

else
    echo "Invalid input"
fi
