#!/bin/sh

pulse-browser &
keepassxc &
thunderbird &
obsidian &
for i in 1 2 3 4 5; do
  i3-msg '[class="pulse-browser"] move to workspace 1'
  i3-msg '[class="KeePassXC"] move to workspace 8'
  i3-msg '[class="thunderbird"] move to workspace 7'
  i3-msg '[class="obsidian"] move to workspace 2'
  i3-msg 'move to workspace 1'
  sleep 1
done
