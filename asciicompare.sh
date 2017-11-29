# !/bin/bash

str1=carrots
str2=tomatoes

if [[ "$str1" < "$str2" ]]
then 
  echo "Although $str1 precede $str2 in the directory,"
  echo -n "this does not necessary imply anything "
  echo "about my culinary preferrences."
else
  echo "What kind of dictionary are you using, anyhow?"
fi
