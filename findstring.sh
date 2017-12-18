#! /bin/bash
# Find a particular string in the binaries in a specified directory.

directory=/usr/bin/
fstring="Free Software Foundation"  #See which files come from the FSF

for file in $( find $directory -type f -name '*' | sort )
do
  strings -f $file | grep "$fstring" | sed -e "s%$directory%%"
done

exit $?
