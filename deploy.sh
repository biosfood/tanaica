#!/bin/bash

# Use this script to copy the files from the repository to the OS
# Usage: <files>: reference to a file containing paths to files which should be synchronized

if [[ $# != 1 ]]; then
  echo "Usage: $0 <input_file>"
  exit
fi

for file in $(cat $1); do
  if [[ $file =~ ~.* ]]; then
    prefix="userhome"
    filename=$(echo $file | sed "s/~//")
    targetFile="$prefix$filename"
    file="$HOME$filename"
  elif [[ $file =~ \/.* ]]; then
    prefix="root"
    targetFile="$prefix$file"
  else
    echo "$file is not a usable path, skipping . . ."
    continue
  fi
  echo "copying $targetFile to $file"
  rm -r $file
  mkdir -p "$(dirname $file)"
  /usr/bin/cp -r ${targetFile} ${file}
done
