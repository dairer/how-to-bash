# Bash Scripting Tutorial

**Introduction**
>* [Why bother with shell scripting?](#why-bother-with-shell-scripting)
>* [Basics](#basics)
>    * [Where is bash?](#where-is-bash)
>    * [Creating a bash script](#creating-a-bash-script)
>    * ['Compiling' and running a shell script.](#compiling-and-running-a-shell-script)
>* [Comments](#comments)

**Working with data**
>* [Variables](#variables)
>* [Reading from command line `read`](#reading-from-command-line-read)
>* [Comparing Variables](#comparing-variables)
>    * [Numeric comparison](#numeric-comparison)
>    * [String comparison](#string-comparison)
>    * [Combining conditions (AND/OR)](#combining-conditions-andor)
>* [Numeric Calculations](#numerical-calculations)
>    * [Calculations with `expr`](#calculations-with-expr)
>    * [Calculations with `let`](#calculations-with-let)
>    * [Calculations with `(())`](#calculations-with-)
>    * [Working with decimals](#working-with-decimals)
>* [Random numbers](#random-numbers)
>* [Data types](#data-types)
>    * [Sequences](#sequences)
>    * [Arrays](#arrays)
>* [Working with data](#working-with-data)
>    * [Text data with `awk`](##text-data-with-awk)
>    * [Pattern searching with `grep`](#pattern-searching-with-grep)
>        * [`grep` with regex](#grep-with-regex)
>        * [`grep` with pipe](#grep-with-pipe)
> * [regex](#regex)
> * [piping](#piping)

**Flow control**
>* [Conditional Statements](#conditional-statements)
>* [Simple consecutive commands](#simple-consecutive-commands)
>* [Conditional consecutive commands](#conditional-consecutive-commands)
>* [Terminating scripts `exit`](#terminating-scripts-exit)
>* [Loops](#loops)
>    * [for loops](#for-loops)
>    * [while loops](#while-loops)

**Working with files**
>* [Basic manipulations](#basic-files-manipulations)
>    * [Creating files](#a-create-a-file-using-touch)
>    * [Writing to files](#b-write-to-a-file-using-)
>    * [Appending to files](#c-append-to-a-file-using-)
>    * [Viewing files](#d-view-a-files-contents-using-cat)
>    * [Creating directories](#e-make-a-directory-with-mkdir-make-directory)
>    * [Renaming files/directories](#f-rename-a-filedirectory-using-mv-move)
>    * [Copying files/directories](#g-copy-a-filedirectory-using-cp-copy)
>    * [Moving files/directories](#h-move-a-file-to-a-directory-using-mv)
>    * [Viewing directories](#i-view-contents-of-a-directory-using-ls-list)
>    * [Deleting files/directories](#j-delete-a-fileempty-directory-using-rm-remove-be-careful-with-this)
>* [Checking status of files](#checking-status-of-files)


**Boss level**
>* [Functions](#functions)
>    * [Simple function](#simple-function)
>    * [Function with local variable](#function-with-local-variable)
>    * [Function with return](#function-with-return)
>    * [Function arguments](#function-arguments)
>    * [Custom commands/Invoking functions from the command line](#custom-commandsinvoking-functions-from-the-command-line)
>* [Aliases](#aliases)








## Why bother with shell scripting?
---


A terminal is an environment where you can directly communicate with your computer.

![terminal](/figs/terminal.gif)

A shell is a program that translates between you and the computer. 
When you type a command into the terminal the shell is the program “translating it” or interpretating it for the computer. A shell script is a file containing a sequence of commands. When a shell script is executed all the commands in the script are run.

Bash is one of several shell syntaxes, you can think of it as a language to communicate with the shell.

Shell scripting is really useful if you find your self preforming mundane and repetitive tasks in the terminal. These tasks can often be automated. 
Familiarity with the command line is essential if you need to work with remote servers. Navigating the server and moving around files etc all requires interaction with the command line when you don’t have a graphical user interface to work with.

Being able to write a quick script to do some data/file management or manipulation on a remote server is a very powerful skill. Working with the command line is intimidating but it's certainly worth doing also it’s fun :)

## Basics
---
### Where is bash?
At the top of every bash scrip you need to tell the computer where bash lives.
We need to figure out where it lives, this can be done using the ```which```
command.

*Note here that the `$` symbol denoted a command typed into the terminal and
lines without this symbol are the outputs of the command*
```bash
$ which bash
/bin/bash
```
This will return the location of bash on your machine.

### Creating a bash script

First thing we need to do is figure out what folder/directory our terminal is currently sitting in. To figure out where
you are you can use ```pwd``` (print working directory)

```bash
$ pwd
Users/yourName
```

We can change to a more sensible directory (folder) using the `cd` command.
```bash
$ cd Desktop/
```

Now our terminal is in the Desktop directory and we can use the command
line to create a new bash script. A quick way to create a file is with the
```touch``` command.

```bash
$ touch myFirstBashScript.sh # creates a file in the "working directory"
```
This will create a file called myFirstBashScript.sh on the desktop.
*Note, every shell script should be saved as a `.sh` file.*

To tell your script where bash is you use ```#!``` which is read "sharp bang" or "shebang" if you're in a rush.

> **`myFirstBashScript.sh`**
>
>```bash
>#! /bin/bash
>```

In this file we can add any bash commands we like. We can create a simple script
that prints a message to the console.

> **`myFirstBashScript.sh`**
>```bash
>#! /bin/bash
>echo "hello world :)"
>```

### 'Compiling' and running a shell script.

Now we want to run this script from the command line. We first need to make this
script executable. To do this we use the `chmod` (change mode) command along with `+x`
(executable). Good news, we only need to do this once.

```bash
$ chmod +x myFirstBashScript.sh
```

Now the script is executable we can execute it, we do this using `./scriptName.sh`

```bash
$ ./myFirstBashScript.sh
hello world :)
```

Bonus: If you're curious to see what other shell syntaxes are available to you:
```bash
$ cat /etc/shells

/bin/bash
/bin/csh
/bin/dash
/bin/ksh
/bin/sh
/bin/tcsh
/bin/zsh
```

## Comments
---
Lines in a bash script starting with a `#` will be ignored when the script is
executed.

To have comments spanning multiple lines use `: ''`.

> **`scriptWithComments.sh`**
>```bash
>#! /bin/bash
>
># here is a single line comments
>echo "thats a nice single line comment"
>
>: '
>Here is a
>multi-line
>comment!
>The space after ':' is important.
>'
>echo "wow, many lines"
>```

Executing this ...
```bash
$ chmod +x scriptWithComments.sh
$ ./scriptWithComments.sh
thats a nice single line comment
wow, many lines
```
... we see that the comments are not sent to the command line.



## Variables
---
By default all variables declared anywhere within a script are global within that script. This means they can be accessed from anywhere within the script

Variable names in bash are by convention in all CAPS. They can contain letters, numbers and underscores but must not start with a number.

To access value stored in a variable we use the `$` symbol.

> **`createAndPrintVar.sh`**
>  ```bash
> #! /bin/bash
> 
> MY_NAME='Jon'
> MY_2ND_NAME=Doe
> MY_AGE=100
> 
> echo "My name is $MY_NAME $MY_2ND_NAME and my age is $MY_AGE"
>```
Executing this:
```bash
$ chmod +x createAndPrintVar.sh
$ ./createAndPrintVar.sh
My name is Jon Doe and my age is 100
```

As you can see bash is not very fussy about variable types but is very fussy about white spaces, for example `MY_AGE = 100` would be invalid.

It is also possible to use `{}` to "concatenate" variable values.

> **`createAndPrintVar.sh`**
> ```bash
> #! /bin/bash
> 
> MY_NAME='Jon'
> MY_2ND_NAME=Doe
> MY_AGE=100
> 
> echo "Name: ${MY_NAME}_${MY_2ND_NAME}, Age: $MY_AGE"
>```
```bash
$ ./createAndPrintVar.sh
Name: Jon_Doe, Age: 100
```


## Reading from command line `read`
---

We can take input from a bash script via the commands line as follows:

> **`userInput.sh`**
>```bash
>#!/bin/bash
># prompt user for input
>echo "Please enter your name:"
>read NAME
>echo "hello $NAME"
>```

We can do this on one line using `read`'s prompt option:

> **`userInput.sh`**
>```bash
>#!/bin/bash
># prompt user for input
>read -p "Please enter your name:" NAME
>echo "hello $NAME"
>```

```bash
$ chmod +x userInput.sh
$ ./userInput.sh
Please enter your name:
$ joe
hello joe
```

If you are prompting for sensitive information such as a password you can us `read`'s silent option:

> **`silentInput.sh`**
>```bash
>#!/bin/bash
># prompt user for silent input
>read -sp "Please enter your password:" PASSWORD
>echo "Thank you"
>```

```bash
$ chmod +x silentInput.sh
$ ./silentInput.sh
Please enter your password:
$ my_password
Thank you
```

## Comparing Variables
---
It's often necessary to compare if two values are equal/not equal, greater than,
less than etc. There are several ways to do this in bash.
We can use traditionl compariston operations such as "==", ">", etc or we can use
more "bash" operations.

### Numeric comparison

```Bash
-eq # equal
-ne # not equal
-gt # greate than
-ge # greater than or equal
-lt # less than
-le # less than or equal
```

Example:
> **`compareNum.sh`**
>```bash
>#! /bin/bash
>
> # declaring two Variables
>VAR_1=1
>VAR_2=10
>
># Comparing numeric values
>if [ $VAR_1 -eq $VAR_2 ]; then
>    echo "$VAR_1 is equal to $VAR_2."
>elif [ $VAR_1 -gt $VAR_2 ]; then
>    echo "$VAR_1 is greater than $VAR_2."
>else
>    echo "$VAR_1 is less than $VAR_2."
>fi
>
>```


Executing this:
```bash
$ chmod +x compareNum.sh
$ ./compareNum.sh
1 is less than 10.
```

### String comparison

```Bash
= # equal
!= # not equal
=~ # contains regex
-z # length of zero
-n # length of non-zero
```


Example:
> **`compareSring.sh`**
>```bash
>#! /bin/bash
>
>STRING_1="hello!"
>STRING_2="Hello :)"
>
># Comparing strings
>if [ "$STRING_1" = "$STRING_2" ]; then
>    echo "$STRING_1 is equal to $STRING_2."
>else
>    echo "strings are not equal"
>fi
>
># use regex to check for substrings
>if [[ "$STRING_1" =~ .*":)".* ]]; then
>    echo "$STRING_1 contains a smiley!"
>else
>    echo "$STRING_1 does not contains a smiley :("
>fi
>
>if [[ "$STRING_2" =~ .*":)".* ]]; then
>  echo "$STRING_2 contains a smiley!"
>else
>  echo "$STRING_2 does not contains a smiley :("
>fi
>
>```

Executing this:
```bash
$ chmod +x compareSring.sh
$ ./compareSring.sh
strings are not equal
hello! does not contains a smiley :(
Hello :) contains a smiley!
```




### Combining conditions (AND/OR)
It is possible to check if several conditions are true using logic operations.

> **`severalConditions.sh`**
>```bash
>#! /bin/bash
>
># declaring two Variables
>VAR_1=-10
>VAR_2=-20
>
># check if they are negative/positive
>if [ $VAR_1 -lt 0 ] && [ $VAR_2 -lt 0 ]; then
>  echo "Both $VAR_1 and $VAR_2 are negative."
>elif [ $VAR_1 -lt 0 ] || [ $VAR_2 -lt 0 ]; then
>  echo "One of $VAR_1 and $VAR_2 is negative..."
>else
>  echo "Both $VAR_1 and $VAR_2 are positive."
>fi
>
> # Note: you can also write [[ $VAR_1 -eq 10  &&  $VAR_2 -eq 10 ]]
>```

Executing this:
```bash
$ chmod +x severalConditions.sh
$ ./severalConditions.sh
Both -10 and -20 are negative.
```






## Numerical Calculations
---
If you want to do some substantial calculations is it certainly preferable to use
a coding language such as Python, c, etc. but it can be useful (and sometimes necessary)
to be able to preform simple calculations in the terminal.

### Calculations with `expr`
If you're happy to be limited to integer calculations you can use the command
`expr`. It is not terribly efficient but gets the job done.

Some examples:
> **`calcWithExpr.sh`**
>```Bash
>#! /bin/bash
>
>VAR_1=10
>VAR_2=3
>
>echo "$VAR_1 plus $VAR_2 = $(expr $VAR_1 + $VAR_2)"
>
>echo "$VAR_1 minus $VAR_2 = $(expr $VAR_1 - $VAR_2)"
>
>echo "$VAR_1 multiplied by $VAR_2 = $(expr $VAR_1 \* $VAR_2)"
>
># note: limited to integer division, decimal points will be dropped
>echo "$VAR_1 divided by $VAR_2 = $(expr $VAR_1 / $VAR_2)"
>
># but we can have a look at the remainder term
>echo "$VAR_1 modulo $VAR_2 = $(expr $VAR_1 % $VAR_2)"
>```

```Bash
$ chmod +x calcWithExpr.sh
$ ./calcWithExpr.sh
10 plus 3 = 13
10 minus 3 = 7
10 multiplied by 3 = 30
10 divided by 3 = 3
10 modulo 3 = 1
```

### Calculations with `let`
Preforming calculations with `let` is much the same as with `expr`
Note that we have to store the result before we can access it when working with `let`.

> **`calcWithLet.sh`**
>```Bash
>#! /bin/bash
>
>VAR_1=10
>VAR_2=3
>
>let RES=$VAR_1+$VAR_2
>echo "$VAR_1 plus $VAR_2 = $RES"
>
>let RES=$VAR_1-$VAR_2
>echo "$VAR_1 minus $VAR_2 = $RES"
>
>let RES=$VAR_1\*$VAR_2
>echo "$VAR_1 multiplied by $VAR_2 = $RES"
>
># note: limited to integer division, decimal points will be dropped
>let RES=$VAR_1/$VAR_2
>echo "$VAR_1 divided by $VAR_2 = $RES"
>
># but we can have a look at the remainder term
>let RES=$VAR_1%$VAR_2
>echo "$VAR_1 modulo $VAR_2 = $RES"
>
># `let` allows us to calculate exponents
>let RES=$VAR_1**$VAR_2
>echo "$VAR_1 rased to the power of $VAR_2 = $RES"
>```

```Bash
$ chmod +x calcWithLet.sh
$ ./calcWithLet.sh
10 plus 3 = 13
10 minus 3 = 7
10 multiplied by 3 = 30
10 divided by 3 = 3
10 modulo 3 = 1
10 rased to the power of 3 = 1000
```



### Calculations with `(())`
This method is called "Arithmetic Expansion".
The double parenthesis affords us some additional operations such as

```Bash
++ # increment (plus 1)
-- # decprement (plus 1)
```

If you're familiar with c/c++ then this method will feel much more natural.
The operations are pretty much the same as c/c++ operations.

Example:
> **`calcWithAritExpr.sh`**
>```bash
>#! /bin/bash
>
>VAR_1=10
>VAR_2=3
>
>echo "$VAR_1 plus $VAR_2 = $((VAR_1 + VAR_2))"
>
>echo "$VAR_1 minus $VAR_2 = $((VAR_1 - VAR_2))"
>
>echo "$VAR_1 multiplied by $VAR_2 = $((VAR_1 * VAR_2))"
>
># note: limited to integer division, decimal points will be dropped
>echo "$VAR_1 divided by $VAR_2 = $((VAR_1 / VAR_2))"
>
># but we can have a look at the remainder term
>echo "$VAR_1 modulo $VAR_2 = $((VAR_1 % VAR_2))"
>
># we can calculate exponents
>echo "$VAR_1 rased to the power of $VAR_2 = $((VAR_1 ** VAR_2))"
>
>echo "$VAR_1 plus 5 = $((VAR_1+=5))"
>
>echo "$VAR_1 minus 5 = $((VAR_1-=5))"
>
># some counter 'functions'
>((VAR_1++))
>echo "VAR_1 incremented is $VAR_1"
>
>((VAR_1--))
>echo "VAR_1 decremented is $VAR_1"
>```

```Bash
$ chmod +x calcWithAritExpr.sh
$ ./calcWithAritExpr.sh
10 plus 3 = 13
10 minus 3 = 7
10 multiplied by 3 = 30
10 divided by 3 = 3
10 modulo 3 = 1
10 rased to the power of 3 = 1000
10 plus 5 = 15
15 minus 5 = 10
VAR_1 incremented is 11
VAR_1 decremented is 10
```


### Working with decimals
If you *insist* on working with decimal/floating point numbers in bash there are
some "hacky" ways to do so.

One way to do so is via the `awk` command and `printf` function.

Example:

> **`decimalCalcAwk.sh`**
>```bash
>#! /bin/bash
>
>awk 'BEGIN {printf("%d divided by %d equals %f\n", 10, 3, 10/3)}'
>```

```Bash
$ chmod +x decimalCalcAwk.sh
$ ./decimalCalcAwk.sh
10 divided by 3 equals 3.333333
```

At this point you should *really* consider working with another, more numerically
inclined language.

## Random Numbers
---

Generating random intgers in bash is very straight forward.
The variable `$RANDOM` is always available to you and gives you a random integer
between 0 and 32767



```Bash
# random integers 0-32767
$ echo $RANDOM
11492
$ echo $RANDOM
27018
$ echo $RANDOM
4065
```

To generate a random integer between 0-n you can use `$(($RANDOM % n+1))`.
Some random numbers between 0 and 10:
```Bash
# random integers 0-10
$ echo $(($RANDOM % 11))
2
$ echo $(($RANDOM % 11))
8
$ echo $(($RANDOM % 11))
1
```



## Data Types
---

### Sequences

To create a sequence of integers from 1 to n we can use `seq n`
```bash
$ seq 5
1
2
3
4
5
```

To create a sequence of integers from m to n we can use `seq m n`
```bash
$ seq 5 9
5
6
7
8
9
```

To create a sequence of integers from m to n in steps of k we can use `seq m k n`
```bash
$ seq 0 2 10
0
2
4
6
8
10
```

```bash
$ seq 0 0.2 1
0
0.2
0.4
0.6
0.8
1
```

Some fancy formatting tricks:
```bash
$ seq -f "%s/01/2020" 1 5
1/01/2020
2/01/2020
3/01/2020
4/01/2020
5/01/2020
```

### Arrays
Arrays are useful for storing elements to itterate over such as file names etc.

We can declare an array as follows
```bash
$ # array with elements
$ myArray=( here is an array 1 2 3 )
$
$ # empty array
$ myEmptyArray=( )
```

To access an array you need to use curly brackets i.e. `{}`
The first position in a bash array is indexed by 0, so to access the first element in an array we can say:

```bash
$ # first element in myArray
$ echo ${myArray[0]}
here
```

The second element:

```bash
$ # second element in myArray
$ echo ${myArray[1]}
is
```
and so on.


If you want to access all elements (eg for a for loop iterable you can use the `@` symbol) e.g.
```bash
$ # all elements
$ echo ${myArray[@]}
here is an array 1 2 3
```

To find the array size we can use the `#` symbol e.g.
```bash
$ # number of elements
$ echo ${#myArray[@]}
7
```

To slice an array you can specify the start and spot position as follows:

```bash
$ # 3rd, 4th and 5th element
$ echo ${myArray[@]:2:4}
an array 1 2
```

To remove the ith element of the array:
```bash
$ # remove second element
$ unset myArray[1]
$ echo ${myArray[@]}
here an array 1 2 3
```

We can append to an array as follows:
```bash
$ # append to an array
$ myArray+=( my new elements )
$ echo ${myArray[@]}
here an array 1 2 3 my new elements
```

We can join two arrays together as follows:
```bash
$ # append to an array
$ secondArray=( 32 412 )
$ bigArray=( ${myArray[@]} ${secondArray[@]} )
$ echo ${bigArray[@]}
here an array 1 2 3 my new elements 32 412
```

Lets see an example of all that in a script:

>**`arrayExample.sh`**
>```bash
>#! /bin/bash
>
># declare an empty array
>myFirstArray=( )
>
># append to array
>myFirstArray+=( 231 hi 4 12 )
>
># print contents of array
>echo Here are all the elements in my array: ${myFirstArray[@]}
>
># access 1st element in array
>echo Here is the first element in my array: ${myFirstArray[0]}
>
># print size of array
>echo My array has ${#myFirstArray[@]} elements
>
># print all elements except 1st
>echo Here are the 2nd to 4th elements: ${myFirstArray[@]:1:3}
>
># join two arrays together
>mySecondArray=( some "more" stuff ) # decalre new array
>bigArray=( ${myFirstArray[@]} ${mySecondArray[@]} ) # join  
>echo All elements: ${bigArray[@]}
>
># remove the second element
>unset bigArray[1]
>echo All elements less second: ${bigArray[@]}
>```



```bash
$ chmod +x arrayExample.sh
$ ./arrayExample.sh

Here are all the elements in my array: 231 hi 4 12
Here is the first element in my array: 231
My array has 4 elements
Here are the 2nd to 4th elements: hi 4 12
All elements: 231 hi 4 12 some more stuff
All elements less second: 231 4 12 some more stuff
```



Useful example:
Suppose you will to apply some command to all files in a directory

>**`arrayOfDir.sh`**
>```bash
>#! /bin/bash
>
># create array of all files in working directoy
>allElementsInDir=( $(ls) )
>
># itterate over all elements in array
>for FILE in ${allElementsInDir[@]} ; do
>    echo $FILE # print array element
>done
>```


```bash
$ chmod +x arrayOfDir.sh
$ ./arrayOfDir.sh

arrayExamples.sh
arrayOfDir.sh
compareNum.sh
compareSring.sh
conditionalStatement.sh
createAndPrintVar.sh
...
```


## Working with data 
---


### Text data with `awk`
Awk is a scripting language that is very powerful for working with data.
An awk command is structured as follows:
`$ awk options script file`

A very simple awk command:
```Bash
$ awk '{print "hello world :)"}'

hello world :)
# Note: press CTRL+D to quit
```



Lets consider this toy data set of randomly selected cities.

> **`cities.txt`**
>```txt
>city, country
>Suining, China
>Debrecen, Hungary
>Meknes, Morocco
>Suez, Egypt
>Tucson (AZ), United States
>Gorgan, Iran
>Dortmund, Germany
>Petah Tiqwa, Israel
>Sevilla, Spain
>Osaka, Japan
>Caucaia, Brazil
>Ulan-Ude, Russia
>Ulhasnagar, India
>Shangqiu, China
>Bobruisk, Belarus
>Zhengzhou, China
>Coro, Venezuela
>Labé, Guinea
>Surat, India
>Huancayo, Peru
>Berezniki, Russia
>Fontana (CA), United States
>Bello, Colombia
>Khomeini shahr, Iran
>LA PAZ, Bolivia
>Garland (TX), United States
>Dire Dawa, Ethiopia
>Mangalore, India
>Radom, Poland
>Catania, Italy
>Fushun, China
>Zanjan, Iran
>Kunming, China
>Adelaide, Australia
>Ghaziabad, India
>Torino, Italy
>Vitebsk, Belarus
>```


Using `awk` we can access different columnes of the data.
`$1` for the first column
`$2` for the second, etc.


```bash
$ awk '{print $1}' cities.txt
city,
Suining,
Debrecen,
Meknes,
Suez,
Tucson
Gorgan,
Dortmund,
Petah
Sevilla,
Osaka,
Caucaia,
...
```

By default awk assumes columnes are divided by a space, i.e. `" "`. We can
specify the delimiter using the `-F` option.

Our cities data is delimited by a comma and space, i.e. `', '`, we can tell
awk this specific delimitation.

We can look at all the cities...
```bash
$ awk -F', ' '{print $1}' cities.txt
city
Suining
Debrecen
Meknes
Suez
Tucson (AZ)
Gorgan
Dortmund
Petah Tiqwa
Sevilla
Osaka
Caucaia
...
```

... and the countries seperatly:
```bash
$ awk -F', ' '{print $2}' cities.txt
country
China
Hungary
Morocco
Egypt
United States
Iran
Germany
Israel
Spain
Japan
Brazil
...
```

If you want to ignore the column heading you can tell awk to only print if line
number is greater than *
```bash
$ awk  -F', ' 'NR>1{print $2}' cities.txt
China
Hungary
Morocco
Egypt
United States
Iran
Germany
Israel
Spain
Japan
Brazil
```



We could also do some fancy formatting:
```bash
$ awk -F', ' 'BEGIN {printf("%-15s %s\n", "Country", "City")
print "-----------------------" }
NR>1 {printf("%-15s %s\n", $2, $1)}' cities.txt

Country         City
-----------------------
China           Suining
Hungary         Debrecen
Morocco         Meknes
Egypt           Suez
United States   Tucson (AZ)
Iran            Gorgan
Germany         Dortmund
Israel          Petah Tiqwa
Spain           Sevilla
Japan           Osaka
Brazil          Caucaia
...
```
Note here we are using awks `printf` function to format the print statements.
The `BEGIN` statement tells awk to do something before any lines are read from the file.


We could print lines that satisfy some requirement, eg print all records where
county equals China.

```bash
$ awk -F', ' 'NR>1 {if($2 == "China") print $0}' cities.txt

Suining, China
Shangqiu, China
Zhengzhou, China
Fushun, China
Kunming, China

```

To read about all the other fun things you can do with `awk` you can view its
manual page as follows:

```bash
$ man awk
```
You can use the `man` (manual) command with most/all(?) unix commands. To exit
the manual press `q`.


### grep

`grep` allows us to search for specific patterns in text. 
For example we can filter a directory of files to ones who's names satisfy some structure or searching for lines in a text file etc. 

The general structure of a grep command is as follows:
`grep stringToFind whereToFindString`
It will then display the results that satisfy the query.

Lets take the **`cities.txt`** data set as an example. Suppose we wish to find all lines that contain "United States"

We can do this as follows:
```bash
$ grep "United States" data/cities.txt

Tucson (AZ), United States
Fontana (CA), United States
Garland (TX), United States
```

This command returned all lines in the file that contained the string we were looking for.

We could also search for files in a directory:
```bash
$ grep "United States" data/cities.txt

Tucson (AZ), United States
Fontana (CA), United States
Garland (TX), United States
```


You can make grep case insensitive using the `-i` option:
```bash
$ grep -i "uNiTeD sTaTeS" data/cities.txt

Tucson (AZ), United States
Fontana (CA), United States
Garland (TX), United States
```


To make sure you are searching for a word and not just a string use option `-w`
```bash
$ grep -iw "states" data/cities.txt

Tucson (AZ), United States
Fontana (CA), United States
Garland (TX), United States
```

To find all lines that do not match the string use the option `-v`

```bash
$ grep -iwv "states" data/cities.txt

Suining, China
Debrecen, Hungary
Meknes, Morocco
Suez, Egypt
...
```
This return all strings that do not have the work "states".


For grep to be useful for us we need to know some regex and understand the piping function.

#### grep with regex
See [regex](#regex) for a quick explanation.
```
# countries that start with A or B
$ grep ", [AB]" data/cities.txt

Caucaia, Brazil
Bobruisk, Belarus
LA PAZ, Bolivia
Adelaide, Australia
Vitebsk, Belarus
```

```bash 
# cities made up of two words
$ grep ".* .*, " data/cities.txt

Tucson (AZ), United States
Petah Tiqwa, Israel
Fontana (CA), United States
Khomeini shahr, Iran
LA PAZ, Bolivia
...
```

#### grep with pipe
See [piping](#piping) for a quick explanation.
 
 We can search for patterns in the output of other commands.

```bash
$ cat data/cities.txt | grep -i "india"

Ulhasnagar, India
Surat, India
Mangalore, India
Ghaziabad, India
```

```bash
$ ls scripts/ | grep -i "function"

functionWithArgs.sh
functionWithLocalVar.sh
functionWithReturn.sh
...
```


## regex
Regex allows us to specify string patterns. 
It is very useful for searching, you can specify the general pattern of all strings you are interested in and find all strings that match your pattern.

Patterns are specified using the following:

```regex
.           any character 
[xyz]       any of "x" "y" or "z"
[^xyz]      none of "x" "y" or "z"
[x-z]       anything from "x" to "z"
x|y         "x" or "y"
x{2}        2 "x"s
x{2,}       2 or more "x"s
x{2,3}      between 2 and 3 "x"s
x*          0 or more "x"s
x+          1 or more "x"s
x?          0 or 1 "x"s
\w          any word 
\d          any digit 
\s          white space
^x	         starts with "x"
x$	         ends with "x"
^x$	        string that matchs "x"
x	          string that contains "x"
```

Examples

Any line starting with "hello" or "Hello"
```
^(H|h)ello
```

Any line with a 10 digit number
```
[0-9]{10}
```

See [`grep`](#grep-with-regex) for further examples.


## piping

Pipes allow us to send the output of one command to another command. They are incredibly useful!

The symbol for piping is `|`. We can also use them to treat the output of one script as the input for another `script1 | script1 | ...`

For example, we can list the contents of the current directory, look at the top 5 lines and then sort them alphabetically. 

```bash
$ ls | head -5 | sort
```

See [`grep`](#grep-with-pipe) for more examples.


## Conditional statements
---

Conditional statements in bash are as follows:
> **`conditionalStatement.sh`**
>```bash
>#! /bin/bash
>
># if statement
>if [ condition ]; then
>    command
>fi
>
># if-else statement
>if [ condition ]; then
>    command
>else
>    command
>fi
>
># if-elif-else statement
>if [ condition ]; then
>    command
>elif [ condition ]; then
>    command
>else
>    command
>fi
>```

The condition to be checked is inside `[  ]` where the spaces either side of the
conditional statement is important.
An if/else statement is closed with a backwards `'if'` i.e. `fi`.


## Simple consecutive commands
---
Commands can be separated by `;` and will be executed in sequence.

This is useful if you are running time consuming commands (eg running some intensive data manipulation script) and don't want to wait for it to finish to type your next command. 

```bash 
$ echo "hello"; echo "hi"
hello
hi
```

## Conditional consecutive commands
---
If you only want the second command to be executed if the first one was successful than use `&&` instead of`;`

Bash interprets "true" as a successfully executed command. 

Example:
```bash
$ [ 123 -eq 123 ] && echo "hi"
hi
$ [ 123 -eq 123 ] && echo "hi"
```
 An example application would be if you want to run a script which will return true if it was successful in its task and if so you can process the data.

## Terminating scripts `exit`
---
We can exit a bash script and "return" a value as we do so.

This is done as follows:
`exit value`

This can be useful in conjunction with [Conditional consecutive commands](#conditional-consecutive-commands). If your script does not satisfy some requirement you can return a "failure" which will make sure you don't execute the commands that follow.

For example
>**`enterName.sh`**
>```bash
>#! /bin/bash
># prompt user to enter name and store it in $NAME
>read -p "please enter your name" NAME
>
># -z returns true if length of string is 0
>if [ -z $NAME ] ; then
>	exit 1 # terminate and return "false"
>else
>	exit 0 # terminate and return "true"
>fi
>```

```bash
$ chmod +x enterName.sh
$ ./enterName.sh && echo "well done :D" || echo "why didnt you enter your name? :("
please enter your name: 
$ joe
well done :D
$
$ ./enterName.sh && echo "well done :D" || echo "why didnt you enter your name? :("
please enter your name: 
$
why didnt you enter your name? :(
```


## Loops
---
### for loops

The general structure of a for loop in bash is as follows:

```bash
for itterator in iterable; do
    # do something
done
```
This is very useful for itterating through elements such as files.
Itterables for for loops in bash are numerous.

Some examples:

>**`forLoops.sh`**
>```bash
>#! /bin/bash
># itterate over a sequence
>for i in $(seq 0 4); do
>    echo $i
>done
>
># itterate over a sequence with a specific step
>for i in $(seq 0 0.25 1); do
>    echo $i
>done
>
># itterate over a explicit sequence
>for i in here are some words; do
>    echo $i
>done
>
># itterate over a range (another possible syntax)
>for i in {1..5}; do
>   echo $i
>done
>```

```bash
$ chmod +x forLoops.sh
$ ./forLoops.sh

0
1
2
3
4

0
0.25
0.5
0.75
1

here 
are 
some 
words

1
2
3
4
5
```


It is also possible to write for loops is a c like syntax:
>**`forLoopCStyle.sh`**
>```bash
>#! /bin/bash
># some c like for-loop syntax 
>for (( i=1; i<=5; i+=1 ))
>do
>   echo $i
>done
>```

```bash
$ chmod +x forLoopCStyle.sh
$ ./forLoopCStyle.sh

1
2
3
4
5
```




### While loops

The general structure of a while loop in bash is as follows:

```bash
while [ condition ]; do
  # do stuff
done
```

Example:
>**`whileLoop.sh`**
>```bash
>#! /bin/bash
>MY_VAR=1
>
>while [ $MY_VAR -lt 6 ]; do
>   echo $MY_VAR
>   ((MY_VAR++)) # increment MY_VAR
>done
>```


```bash
$ chmod +x whileLoop.sh
$ ./whileLoop.sh

1
2
3
4
5
```

## Basic files manipulations
---
Bash is extremely useful for quickly and efficiently manipulating
files/directories.

### a. Create a file using `touch`.
```bash
$ touch new_file.txt
```

### b. Write to a file using `>`
```bash
$ echo 'What a useful command!' > new_file.txt
```

### c. Append to a file using `>>`
```bash
$ echo '~~~ second line :o ~~~' >> new_file.txt
```

### d. View a files contents using `cat`.
```bash
$ cat new_file.txt
What a useful command!
~~~ second line :o ~~~
```

### e. Make a directory with `mkdir` (make directory)
```bash
$ mkdir new_folder
```

### f. Rename a file/directory using `mv` (move)
```bash
# rename "new_file.txt" to "old_file.txt"
$ mv new_file.txt old_file.txt
```

### g. Copy a file/directory using `cp` (copy)
```bash
# Make a copy of "old_file.txt" called "old_file_backup.txt"
$ cp old_file.txt old_file_backup.txt
```

### h. Move a file to a directory using `mv`
```bash
$ mv old_file.txt new_folder
```

### i. View contents of a directory using `ls` (list)
```bash
$ ls new_folder
old_file.txt
```

### j. Delete a file/empty directory using `rm` (remove) (be careful with this!)
```bash
$ rm new_folder
```

Delete a non-empty directory using `rm -r`.
Be VERY careful with this! You won't get any _"Are you sure?"_ messages.
```bash
$ rm -r new_folder
```


## Checking status of files
---

We can check the status of a file/directory as follows:
```bash
-e # file exists
-d # file exists and is a directory
-f # file exists and is not a directory
-r # file exists and is readable
-w # file exists and is writable
-x # file exists and is executable
-s # file exists and is of non-zero size
```

Example:
> **`statusOfFile.sh`**
>```bash
>#! /bin/bash
>
>FILE_NAME="test_file.txt"
>
>if [ -w $FILE_NAME ]; then
>    echo "$FILE_NAME exists and is writable."
>elif [ -r $FILE_NAME ]; then
>    echo "$FILE_NAME exists and is readable but not writable."
>elif [ -e $FILE_NAME ]; then
>    echo "$FILE_NAME exists but is not readable or writable."
>else
>    echo "$FILE_NAME does not exist"
>fi
>```


```bash
$ chmod +x statusOfFile.sh
$ ./statusOfFile
test_file.txt does not exist

$ touch test_file.txt # create file
$ ./statusOfFile
test_file.txt exists and is writable.

$ chmod -w test_file.txt # make it unwritable
$ ./statusOfFile
test_file.txt exists and is readable but not writable.

$ chmod +w test_file.txt # make it unwritable
$ ./statusOfFile
test_file.txt exists and is writable.
```



## Functions
---
Functions help you avoid copying and pasting code. If you find yourself writing the same code over and over you should put it in a function and call the function every time you need it. This also makes your code much more readable and general. 

### Simple function
The general stricture of a bash functions is:

```bash
myFunction () {
  # do something
}
```

Whenever you invoke the function, i.e. by executing the command `myFunction` the command(s) inside the function is executed. 

An example:

> **`simpleFunction.sh`**
>```bash
>#! /bin/bash
># define the function
>sayHello () {
>	echo hello
>}
>
># invoke the function 
>sayHello
>```

```bash
$ chmod +x simpleFunction.sh
$./simpleFunction.sh
hello
```

### Function with local variable
All variables in a bash script are global, meaning they can be accessed from anywhere in the script. 

If you wish for a variable to be local to a function you can declare it with `local`. This will mean that the variable is only accessible within the function.

Example:
> **`functionWithLocalVar.sh`**
>```bash
>#! /bin/bash
>
># define a global variable
>VAR_GLO="hello"
>
>sayHello () {
>	# define a local variable
>	local VAR_LOC="world"
>
>	# define another global variable
>	VAR_GLO_2=":D"
>
>	# print message
>	echo "$VAR_GLO $VAR_LOC $VAR_GLO_2"
>}
>
># invoke function
>sayHello
>
># try to access local variable (fails)
>echo "$VAR_GLO $VAR_LOC $VAR_GLO_2"
>```


```bash
$ chmod +x functionWithLocalVar.sh
$./functionWithLocalVar.sh
hello world :D
hello  :D
```

We can see that the variable defined as local within the function is not accessible outside the function. Note, however, that we do not get an error message, all that happens is that nothing is returned from  `$VAR_LOC` when called outside its scope. 


### Function with return 

A function in bash will "return" the output of the last command in the function.

Since variables assigned within functions are global we can also just store what ever variable we are interested within the function and access it outside the function

Example:
> **`functionWithReturn.sh`**
>```bash
>#! /bin/bash
>
># generate a random integer with $RANDOM and echo it
>CreateARandomNumber () {
>	echo $RANDOM 
>}
># invoke function and access returned value
>echo "Here is my random number: $(CreateARandomNumber)"
>
># generate a random integer with $RANDOM and store it
>StoreARandomNumber () {
>	MY_RANDOM_NUM=$RANDOM 
>}
>StoreARandomNumber # invoke function
>echo "Here is my random number: $MY_RANDOM_NUM"
>```


```bash
$ chmod +x functionWithReturn.sh
$./functionWithReturn.sh
Here is my random number: 20754
Here is my random number: 30892
```

### Function arguments
It is possible to pass arguments to a function by simply invoking the function followed by the arguments to pass to it.

Generally, that is:
`myFunction arg1 arg2 ...`

From within the function you can access the first argument with `$1`, the second argument with `$2`, and so on.

To see the number of arguments passed to the function you can use `$#`
 To see all the arguments in a sequence we can use `$@`
 
Example:
> **`functionWithArgs.sh`**
>```bash
>#! /bin/bash
>
>helloEveryone () {
>	# $# accesses the number of arguments
>	echo "Hello to these $# people:"
>
>	# $@ accesses all the arguments in a "sequence"
>	for i in "$@" ; do
>		echo "hello $i"
>	done
>}
>
>helloEveryone Santa-Claus Scooby-Doo bob
>```

```bash
$ chmod +x functionWithArgs.sh
$./functionWithArgs.sh
Hello to these 3 people:
hello Santa-Claus
hello Scooby-Doo
hello bob
```


### Custom commands/Invoking functions from the command line
It would be nice if we could say hi to all these people without having to go and edit/execute the script. 
It is possible to make the functionl globally accessible from the command line :o

To do this you need to access your `.bashrc` or `.bash_profile` (if `.bashrc` doesn't exist on your machine.)

You could simply create a `.bashrc` and call it from your `.bash_profile` file but you can also just work with the `.bash_profile`  which is what I'll do here.

Suppose we want the funcion 
>```bash
>helloEveryone () {
>	# $# accesses the number of arguments
>	echo "Hello to these $# people:"
>
>	# $@ accesses all the arguments in a "sequence"
>	for i in "$@" ; do
>		echo "hello $i"
>	done
>```
To be available to us from the command line all the time. 


We first need to create a script to store this function (and any other functions you wish to be accessible from the command line).

You can call this script what ever you like.

To do this: navigate to your `home/user` directory
```bash
$ cd
```
Create a file to store your very important function. (Note that the function name starts with a ".")
```bash
$ touch .my_functions.sh
```

Open this file and edit it however you wish (vim is great for this stuff if you're familiar with it) and paste in your function. 
> **`.my_functions.sh`**
>```bash
>#! /bin/bash
>
>helloEveryone () {
>	# $# accesses the number of arguments
>	echo "Hello to these $# people:"
>
>	# $@ accesses all the arguments in a "sequence"
>	for i in "$@" ; do
>		echo "hello $i"
>	done
>}
>```

Now we need to tell bash where to find our custom functions.

Open up `.bash_profile` (or `.bashrc`) and paste the following.
```bash
# here is where my functions live
source ~/.my_functions.sh
```

To update your `.bash_profile` file either restart the terminal or run
```bash
$ source ~/.bash_profile
```

Now your function is available from the command line when ever you need it :D

Example:
```bash
$ helloEveryone Santa-Claus Scooby-Doo bob
Hello to these 3 people:
hello Santa-Claus
hello Scooby-Doo
hello bob
```

##  Aliases
---
A bash alias is exactly what it sounds like. Its a custom name for some command.
This can be useful for when you find your self continuously typing long commands into the terminal. You can create an alias for this command which is much quicker to type and easier to remember. 

 The general form of declaring an alias is as follows:
 `alias newName="annoying long command"`

Here's an example.
We could make an alias for `chmod +x ` which is something we need to write every time we create a new shell script. I'm lazy enough to want a shorter version of this command.

```bash
$ alias mx="chmod +x"
```

Now if i type `mx` bash will interpret it as `chmod +x`.
 We can test this out:
```bash
$ # creat a new script the lasy way
$ printf "#!/ bin/bash \necho hi there\n" > tempScript.sh
$ # make it excecutable with our new command
$ mx tempScript.sh
$ ./tempScript.sh
hi there
```
yay it works!


Unfortunately this alias will disappear after you close the terminal or open a new one. 
It is quite straight forward to make a "permanent" alias though.

We need to add the specification of the alias in out `.bashrc` or `.bash_profile` file.
See [this section](#custom-commandsinvoking-functions-from-the-command-line) for a bit more detail on accessing these files.

I will just add this alias to my `.my_functions.sh` script [see here](#custom-commandsinvoking-functions-from-the-command-line) on how and where i created this script. 

>**`.my_functions.sh`**
>```bash
>#!/bin/bash
>
># my functions
> ...
>
># my Aliases
>alias mx="chmod +x"
>```

Now I just need to recompile the `.bash_profile` script or relaunch the terminal and the alias will be always available to me!

```bash
$ source ~/.bash_profile
```

<p align="center">
  <img src="/figs/end.gif" />
</p>
