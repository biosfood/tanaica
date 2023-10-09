#!/bin/bash

fehBackground=$(cat ~/.fehbg | tail -n 1 | cut -d\' -f2)
name=$(basename ${fehBackground})

if [[ ! -f "~/.var/backgrounds/liked/$name" ]]; then
  mkdir -p ~/.var/backgrounds/liked
  mv $fehBackground ~/.var/backgrounds/liked/$name
  feh --bg-fill ~/.var/backgrounds/liked/$name
else
  echo "You seem to have already liked this background!"
fi
