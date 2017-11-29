# !/bin/bash
# Reading lines in /home/hdq/shellLearn/test.sh.

File=/home/hudanqi/shellLearn/test.sh
{
read line1
read line2
} < $File

echo "First line in $File is :"
echo "$line1"
echo "Second line in $File is :"
echo "$line2"

exit 0

# Now. how do you parse the separate fields of each line?
# Hint: use awk, or ...
# ... Hans-Joerg Diers suggests using the "set" Bash builtin.
