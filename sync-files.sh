#!/usr/bin/bash

# Use this script to copy the files from the OS to the repository.
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
  echo "copying $file to $targetFile"
  rm -r $targetFile
  mkdir -p "$(dirname $targetFile)"
  /usr/bin/cp -r ${file} ${targetFile}
done

git update-index --skip-worktree userhome/.config/konsolerc
