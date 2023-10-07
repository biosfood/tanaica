#!/bin/bash

# Use this script to copy the files from the repository to the OS
# it overllays the userhome over ~ and root over /

cd userhome && rsync -avR . ~ && cd ..

cd root && sudo rsync -avr . / && cd ..
