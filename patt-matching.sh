#! /bin/bash

# Pattern matching using the # ## % %% parameter substitution operators.

var1=abcd12345abc6789
pattern1=a*c

echo 
echo "var1 = $var1"
echo "var1 = ${var1}"

echo "Number of characters in ${var1} = ${#var1}"
echo

echo "pattern1 = $pattern1"
echo "------------"
echo '${var1#$pattern1} =' "${var1#$pattern1}"
echo '${var1##$pattern1} =' "${var1##$pattern1}"

pattern2=b*9
echo "var1=$var1"
echo
echo "pattern2=$pattern2"
echo "------------------"
echo '${var1%$pattern2} =' "${var1%$pattern2}"
echo '${var1%%$pattern2} =' "${var1%%$pattern2}"

echo
exit 0
