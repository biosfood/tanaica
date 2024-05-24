#!/bin/bash
SECONDS=0

dbus-send --print-reply --dest=org.keepassxc.KeePassXC.MainWindow /keepassxc org.keepassxc.KeePassXC.MainWindow.lockAllDatabases

set -e 
i3lock --nofork --show-failed-attempts --ignore-empty-password -c 000000
xset dpms

rofi -e "woke up from suspend after $(($SECONDS / 3600))h $((($SECONDS % 3600) / 60))m $(($SECONDS % 60))s"
