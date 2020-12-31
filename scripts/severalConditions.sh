#! /bin/bash

# declaring two Variables
VAR_1=-10
VAR_2=-20

# check if they are negative/positive
if [ $VAR_1 -lt 0 ] && [ $VAR_2 -lt 0 ]; then
 echo "Both $VAR_1 and $VAR_2 are negative."
elif [ $VAR_1 -lt 0 ] || [ $VAR_2 -lt 0 ]; then
 echo "One of $VAR_1 and $VAR_2 is negative..."
else
 echo "Both $VAR_1 and $VAR_2 are positive."
fi

# Note: you can also write [[ $VAR_1 -eq 10  &&  $VAR_2 -eq 10 ]]