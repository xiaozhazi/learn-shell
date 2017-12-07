#! /bin/bash
# ifs.sh

var1="a+b+c"
var2="s-e-f"
var3="g,h,i"

IFS=+
echo $var1
echo $var2
echo $var3

IFS=-
echo $var1
echo $var2
echo $var3

echo

IFS=,
echo $var1 $var2 $var3

output_args_one_per_line(){
  for arg
  do 
    echo "[$arg]"
  done 
}

echo; echo "IFS=\" \" "
echo "------------"
IFS=" "
var=" a  b c   "
output_args_one_per_line $var

echo "------------"
echo; echo "IFS=:"
IFS=:
var=":a::b:c:::"
output_args_one_per_line $var

echo
exit 0
