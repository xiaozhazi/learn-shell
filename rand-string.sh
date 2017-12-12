#! /bin/bash
if [ -n "$1" ]
then
  str0="$1"
else
  str0="$$"
fi

POS=2 #starting from position 2 in the string
LEN=8 #then set start-string to it

str1=$( echo "$str0" | md5sum | md5sum )
randstring="${str1:$POS:$LEN}"

echo "$randstring"
exit $?

