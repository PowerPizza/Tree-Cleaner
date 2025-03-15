#!/bin/bash

if [ $# -gt 1 ]; then
  echo "Error : Invalid number of arguments passed."
  exit 1
fi

ls $1 &> /dev/null
if [ $? -ne 0 ]; then
  echo "Error : Given path is invalid or not exists."
  exit 1
fi

if [ $# -eq 0 ]; then
  p="."
else
  p="$1"
fi

n=1
while [ $n -gt 0 ]
do
  n=$(find "$p" -type d -empty | wc -l)
  echo "Removing $n empty folders."
  find "$p" -type d -empty -exec rmdir "{}" + 2> errors.log
done
