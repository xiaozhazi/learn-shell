#! /bin/bash

while [ $# -gt 1 ]
do
  case $1 in 
    -f) #code for -f here
      ;;
    -q) #code for -q here 
      ;;
      ...
      *) break ;;
    esac
    shift
done

exec real-app -q "$qargs" -f "$fargs" "$@"
echo real-app failed, get help! 1>&2
