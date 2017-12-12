#! /bin/bash
# paragraph-space.sh

# Insert a blank line between paragraphs of a single-spaces text file

MINLEN=60

while read line
do 
  echo "$line"

  len=${#line}
  if [[ "$len" -lt "$MINLEN" && "$line" =~ [*{\.}]$ ]]
   then echo
  fi
done

exit
