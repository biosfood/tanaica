#!/bin/bash

# Use this script to copy the files from the repository to the OS
# it overllays the userhome over ~ and root over /

rsync -avr userhome ~
sudo rsync -avr root /
