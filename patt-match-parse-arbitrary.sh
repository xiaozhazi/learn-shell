#! /bin/bash
var1=abcd-1234-defg
echo "var1 = $var1"

t=${var1#*-*}
echo $t
t=${var1##*-*}
echo $t

#------------------------------------
path_name=/home/bozo/ideas/thoughts.for.today
echo "path_name = $path_name"
t=${path_name##/*/}
echo "$path_name, stripped of prefixes = $t"
t=`basename $path_name`
echo "basename $path_name = $t"
t=${path_name%/}
echo $t

t=${path_name%/*.*}
echo '${path_name%/*.*} =' $t

t=${path_name:11}
echo "$path_name, with first 11 chars stripped off = $t"
t=${path_name:11:5}
echo "$path_name, with first 11 chars stripped off, length 5 =$t"

echo

t=${path_name/bozo/clown}
echo "$path_name with \"bozo\" replaced by \"clown\" = $t"
t=${path_name/today/}
echo "$path_name with \"today\" deleted = $t"
t=${path_name//o/O}
echo "$path_name with all o's captialized = $t"
t=${path_name//o/}
echo "$path_name with all o's deleted = $t"


v0=abc1234zip1234abc
echo "v0 = $v0"
echo

# Match at prefix of string
v1=${v0/#abc/ABCDEF}
echo "v1 = $v1"

#Match at suffix of string
v2=${v0/%abc/ABCDEF}
echo "v2 = $v2"
echo

# Must match at the begining/end of the string, otherwise no replacement results
v3=${v0/%123/ABCDEF}
echo "v3 = $v3"
v4=${v0/#123/ABCDEF}
echo "v4 = $v4"

exit 0
