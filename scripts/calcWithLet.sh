#! /bin/bash

VAR_1=10
VAR_2=3

let RES=$VAR_1+$VAR_2
echo "$VAR_1 plus $VAR_2 = $RES"

let RES=$VAR_1-$VAR_2
echo "$VAR_1 minus $VAR_2 = $RES"

let RES=$VAR_1\*$VAR_2
echo "$VAR_1 multiplied by $VAR_2 = $RES"

# note: limited to integer division, decimal points will be dropped
let RES=$VAR_1/$VAR_2
echo "$VAR_1 divided by $VAR_2 = $RES"

# but we can have a look at the remainder term
let RES=$VAR_1%$VAR_2
echo "$VAR_1 modulo $VAR_2 = $RES"

# `let` allows us to calculate exponents
let RES=$VAR_1**$VAR_2
echo "$VAR_1 rased to the power of $VAR_2 = $RES"