#! /bin/bash

FILE_NAME="test_file.txt"

if [ -w $FILE_NAME ]; then
   echo "$FILE_NAME exists and is writable."
elif [ -r $FILE_NAME ]; then
 echo "$FILE_NAME exists and is readable but not writable."
elif [ -e $FILE_NAME ]; then
 echo "$FILE_NAME exists but is not readable or writable."
else
   echo "$FILE_NAME does not exist"
fi