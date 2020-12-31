#! /bin/bash

# define a global variable
VAR_GLO="hello"

sayHello () {
	# define a local variable
	local VAR_LOC="world"

	# define another global variable
	VAR_GLO_2=":D"
	echo "$VAR_GLO $VAR_LOC $VAR_GLO_2"
}

# invoke function
sayHello

ech