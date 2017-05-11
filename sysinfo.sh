#!/bin/bash
echo -e "\e[32;41mSystem information for the machine $(HOSTNAME)\e[0m"
echo
echo "Disk free space is "
free -h | grep Mem: | awk '{print "Free spacei is " $3 " " "and the used space is " $4}'
echo
echo

