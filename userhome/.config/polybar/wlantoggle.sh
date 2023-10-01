#!/usr/bin/bash

sleep_pid=0

toggle() {
    if [ $(nmcli radio wifi) == 'disabled' ]; then
      nmcli radio wifi on
    else
      nmcli radio wifi off
    fi

    if [ "$sleep_pid" -ne 0 ]; then
        kill $sleep_pid >/dev/null 2>&1
    fi
}


trap "toggle" USR1
newline='
'

showConnectionInformation() {
  connectionRaw=$(iwconfig wlan0)
  readarray -t connection < <(echo "$connectionRaw")
  essid=$(echo ${connection[0]} | sed "s/.*ESSID://")
  if [[ "$essid" == "off/any" ]]; then
    printf "%%{B$tertiaryContainer F$onTertiaryContainer}  \u1be4 searching  \n"
  else
    linkQuality=$(echo $connectionRaw | grep -Eo "Link Quality=[0-9]*/[0-9]*")
    if [[ $linkQuality != "" ]]; then
      percent=$(echo $linkQuality | grep -Eo "[0-9]*/[0-9]*" | awk '{print "scale=2;" $0 "*100"}' | bc)
      printf "%%{B$primaryContainer F$onPrimaryContainer}  \u1be4 %s (%.0f%%)  \n" "$(echo $essid | sed 's/"//g')" $percent
      return
    fi
    echo "WIFI: $(echo $essid | sed 's/"//g')"
  fi
}

while true; do
    if [ $(nmcli radio wifi) == 'disabled' ]; then
      printf "%%{B$errorContainer F$onErrorContainer}  \u1be4  \n"
    else
      showConnectionInformation
    fi
    sleep 3 &
    sleep_pid=$!
    wait
done
