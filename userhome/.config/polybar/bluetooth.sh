#!/usr/bin/bash

sleep_pid=0

toggle() {
  if [[ "$(echo "show" | bluetoothctl | grep Powered)" =~ yes ]]; then
    _=$(bluetoothctl power off)
  else
    _=$(bluetoothctl power on)
  fi

  if [ "$sleep_pid" -ne 0 ]; then
    kill $sleep_pid >/dev/null 2>&1
  fi
}


trap "toggle" USR1
newline='
'

showConnectionInformation() {
  name=$(bluetoothctl info | grep -Eo "Name: .*" | sed "s/Name: //")
  printf "%%{B$primaryContainer F$onPrimaryContainer}  \u16d2 $name  \n"
}

while true; do
    if [[ "$(bluetoothctl show | grep -Eo "Powered: .*" | sed "s/Powered: //")" == "yes" ]]; then
      showConnectionInformation
    else
      printf "%%{B$errorContainer F$onErrorContainer}   \u16d2   \n"
    fi
    sleep 3 &
    sleep_pid=$!
    wait
done
