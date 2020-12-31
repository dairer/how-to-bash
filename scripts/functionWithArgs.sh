#! /bin/bash


helloEveryone () {

	# dollar hash accesses the number of arguments
	echo "Hello to these $# people:"

	# dollar at accesses all the arguments in a "sequence"
	for i in "$@" ; do
		echo "hello $i"
	done
}

helloEveryone Santa-Claus Scooby-Doo bob