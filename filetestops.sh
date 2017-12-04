# !/bin/bash

device="/dev/sda2"
if [ -b "$device0" ]
then
  echo "$device0 is a block device."
fi

device1="/dev/ttyS1"
if [ -c "device1" ]
then 
  echo "$device1 is a character device."
fi

function show_input_type()
{
  [ -p /dev/fd/0 ] && echo PIPE || echo STDIN
}

show_input_type "Input"
echo "Input" | show_input_type


