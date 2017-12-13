#! /bin/bash

#Converts all the MacPaint image files in a directory to "pbm" format.

# Uses the "macptopbm" binary from the "netpbm" package
#+ which is maintained by Brian Henderson
# Netpbm is a standard part of most Linux distros.


#OPERATION=macptopbm
#SUFFIX=pbm
#
#if [ -n "$1" ]
#then
#  directory=$1
#else
#  directory=$PWD
#fi
#
## Assumes all files in the target directory are MacPaint image files,
## with a ".mac" filename suffix.
#
#for file in $directory/*
#do
#  filename=${file%.*c}
#  $OPERATION $file > "$filename.$SUFFIX"
#
#  rm -f $file
#  echo "$filename.$SUFFIX"
#done
#
#exit 0

INFMT=png
OUTFMT=pdf

for pic in *"$INFMT"
do
  p2=$(ls "$pic" | sed -e s/\.$INFMT//)
  convert "$pic" $p2.$OUTFMT 
done

exit $?
