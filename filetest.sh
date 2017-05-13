#!/bin/bash

#This scripts tests if the input arguments passed is file or directory
if [ -d $1 ]    
then
	echo "It is a directory and exists"
	pwd
elif [ -e $1 ]
then
    echo "It is a file not a directory"
    
else
    echo "Not exists"
fi
