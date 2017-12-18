#! /bin/bash

var0=0
LIMIT=10

while [ "$var0" -lt "$LIMIT" ]
do
  echo -n "$var0 "
  var0=`expr $var0 + 1`
done

echo

while [ "$var1" != "end" ]
do
  echo "Input variable #1 (end to exit) "
  read var1
  echo "variable #1 = $var1"
  echo
done
