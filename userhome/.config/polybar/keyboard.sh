#!/usr/bin/bash

pid=0

toggle() {
  layout=$(setxkbmap -query | grep -Eo "layout: +.*" | sed "s/layout:\s*//")
  if [[ "$layout" =~ de ]]; then
    $(setxkbmap us)
  else
    $(setxkbmap de)
  fi
  if [[ $pid != 0 ]]; then
    kill $pid >/dev/null 2>&1
  fi
}

trap "toggle" USR1

while true; do
  layout=$(setxkbmap -query | grep -Eo "layout: +.*" | sed "s/layout:\s*//")
  printf "  ⌨: $layout  \n"
  sleep infinity &
  pid=$!
  wait
done
