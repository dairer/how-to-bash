#! /bin/bash
# prompt user to enter name and store it in $NAME
read -p "please enter your name" NAME

# -z returns true if length of string is 0
if [ -z $NAME ] ; then
  exit 1 # terminate and return "false"
else
  exit 0 # terminate and return "true"
fi