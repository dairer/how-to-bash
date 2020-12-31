#! /bin/bash

STRING_1="hello!"
STRING_2="Hello :)"

# Comparing strings
if [ "$STRING_1" = "$STRING_2" ]; then
   echo "$STRING_1 is equal to $STRING_2."
else
   echo "strings are not equal"
fi

# use regex to check for substrings
if [[ "$STRING_1" =~ .*":)".* ]]; then
   echo "$STRING_1 contains a smiley!"
else
   echo "$STRING_1 does not contains a smiley :("
fi

if [[ "$STRING_2" =~ .*":)".* ]]; then
 echo "$STRING_2 contains a smiley!"
else
 echo "$STRING_2 does not contains a smiley :("
fi