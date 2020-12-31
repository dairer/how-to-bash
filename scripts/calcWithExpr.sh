#! /bin/bash

VAR_1=10
VAR_2=3

echo "$VAR_1 plus $VAR_2 = $(expr $VAR_1 + $VAR_2)"

echo "$VAR_1 minus $VAR_2 = $(expr $VAR_1 - $VAR_2)"

echo "$VAR_1 multiplied by $VAR_2 = $(expr $VAR_1 \* $VAR_2)"

# note: limited to integer division, decimal points will be dropped
echo "$VAR_1 divided by $VAR_2 = $(expr $VAR_1 / $VAR_2)"

# but we can have a look at the remainder term
echo "$VAR_1 modulo $VAR_2 = $(expr $VAR_1 % $VAR_2)"