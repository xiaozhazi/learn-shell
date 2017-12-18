#! /bin/bash

# Lists symbolic links in a directory.

directory=${1-`pwd`}

# Equivalent to code block below.
# ARGS=1   #Expect one command-line argument
# if [ $# -ne "$ARGS" ]
# then
#  directory=`pwd`
# else
#  directory=$1
# fi

echo "Symbolic links in directory \"$directory\""
for file in "$( find $directory -type l )"
do 
  echo "$file"
done | sort

exit 0


echo "symbolic links in directory \"$directory\""
OLDIFS=$IFS
IFS=:

for file in $( find $directory -type l - printf "%p$IFS")
do
  echo "$file"
done | sort

IFS=''
for file in $( find $directory -type l)
do
  echo $file 
done | sort



# an alternative syntax to a for loop that will look very familiar to C
OUTFILE=symlinks.list

directory=${1-`pwd`}
echo "Symbolic links in directory \"$directory\"" > "$OUTFILE"
echo "-------------------" >> "$OUTFILE"
for file in "$( find $directory -type l )"
do 
  echo "$file"
done | sort >> "$OUTFILE"

# echo "Output file = $OUTFILE"
exit $?
