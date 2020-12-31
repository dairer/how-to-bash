#! /bin/bash

# declare an empty array
myFirstArray=( )

# append to array
myFirstArray+=( 231 hi 4 12 )

# print contents of array
echo Here are all the elements in my array: ${myFirstArray[@]}

# access 1st element in array
echo Here is the first element in my array: ${myFirstArray[0]}

# print size of array
echo My array has ${#myFirstArray[@]} elements

# print all elements except 1st
echo Here are the 2nd to 4th elements: ${myFirstArray[@]:1:3}

# join two arrays together
mySecondArray=( some "more" stuff ) # decalre new array
bigArray=( ${myFirstArray[@]} ${mySecondArray[@]} ) # join togeher
echo All elements: ${bigArray[@]}

# remove the second element
unset bigArray[1]
echo All elements less second: ${bigArray[@]}


all_elements_in_dir=( $(ls) )
echo ${all_elements_in_dir[@]}
