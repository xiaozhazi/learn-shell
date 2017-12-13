#! /bin/bash

String=23skidool
#      012345678 Bash
#      123456789 awk

# Note the different string indexing system:
# Bash numbers first character of string as 0
# Awk numbers first character of string as 1


echo ${String:2:4}     #position 3 (0-1-2), 4 characters long

# The awk equivalent of ${string:pos:length} is substr(string,pos,length)
echo | awk '
{ print substr("'"${String}"'",3,4) 
}'
# piping an empty "echo" to awk gives it dummy imput,
#+ and thus makes it necessary to supply a filename.

echo "------"

echo | awk '{
 print index("'"${String}"'", "skid")
}'

exit 0


