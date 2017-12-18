#! /bin/bash

for planet in Mercury Venus Earth Mars Juptier Saturn Uranus Neptune Pluto
do
  echo $planet
done

for planet in "Mercury Venus Earth Mars Juptier Saturn Uranus Neptune Pluto"
do
  echo $planet
done


for planet in "Mercury 36" "Venus 67" "Earth 93" "Mars 142" "Juptier 483"
do
  set -- $planet
  echo "$1       $2,000,000 miles from the sun"
done



FILES="/usr/sbin/accept
      /usr/sbin/pwck
      /usr/sbin/chroot
      /usr/bin/fakefile
      /sbin/badblocks
      /sbin/ypbind"

echo

for file in $FILES
do
  if [ ! -e "$file" ]
  then
    echo "$file does not exist."; echo
    continue
  fi
  ls -l $file | awk '{ print $8 "     file size: " $5 }'
  whatis `basename $file`
  echo
done

filename="*txt"
for file in $filename
do
  echo "Contents of $file"
  echo "-------"
  cat "$file"
  echo 
done


NUMBERS="9 7 3 8 37.53"
for number in `echo $NUMBERS`
do
  echo -n "$number "
done




for a in 1 2 3 4 5 6 7 8 9 10
do
  echo -n "$a "
done


for a in `seq 10`
do
  echo -n "$a "
done 


for a in {1..10}
do
  echo -n "$a "
done


LIMIT=10
for ((a=1; a<=LIMIT; a++))
do
  echo -n "$a "
done



for((a=1,b=1; a<=LIMIT; a++,b++))
do
  echo -n "$a-$b "
done

# do not use the do and done 
for((n=1; n<=10; n++))
{
  echo -n "* $n *"
}

# in a classic for-loop (for n in [list]) a terminal semicolon is required.
for n in 1 2 3
{
  echo -n  "* $n *";
}
