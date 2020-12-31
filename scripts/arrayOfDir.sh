#! /bin/bash

# create array of all files in working directoy
allElementsInDir=( $(ls) )

# itterate over all elements in array
for FILE in ${allElementsInDir[@]} ; do
    echo $FILE # print array element
done
