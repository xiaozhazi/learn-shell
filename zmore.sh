# !/bin/bash

# View gzipped files with 'more' filter.

E_NOARGS=85
E_NOTFOUND=86
E_NOTGZIP=87

if [ $# -eq 0 ]  # same effect as: if [ -z "$1" ]
# $1 can exist, but be empty: zmore "" arg2 arg3
then
  echo "Usage:`basename $0` filename" >&2
  # Error message to stderr.
  exit $E_NOTGZIP
fi

filename=$1


