#!/usr/bin/bash

if [[ $# != 1 ]]; then
  echo "Usage: $0 <input_file>"
  exit
fi

for file in $(cat $1); do
  echo "syncing $file..."
done
