#! /bin/bash

CreateARandomNumber () {
	# generate a random integer with $RANDOM and echo it
	echo $RANDOM 
}

# invoke function and echo retured value
echo "Here is my random number: $(CreateARandomNumber)"


StoreARandomNumber () {
	# generate a random integer with $RANDOM and store it
	MY_RANDOM_NUM=$RANDOM 
}

StoreARandomNumber # invoke function
echo "Here is my random number: $MY_RANDOM_NUM"



