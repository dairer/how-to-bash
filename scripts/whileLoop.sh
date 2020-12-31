#! /bin/bash
MY_VAR=1

while [ $MY_VAR -lt 6 ]; do
  echo $MY_VAR
  ((MY_VAR++)) # increment MY_VAR
done