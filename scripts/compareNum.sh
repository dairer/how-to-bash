#! /bin/bash

# declaring two Variables
VAR_1=1
VAR_2=10

# Comparing numeric values
if [ $VAR_1 -eq $VAR_2 ]; then
   echo "$VAR_1 is equal to $VAR_2."
elif [ $VAR_1 -gt $VAR_2 ]; then
   echo "$VAR_1 is greater than $VAR_2."
else
   echo "$VAR_1 is less than $VAR_2."
fi