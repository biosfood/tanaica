# Environment variables in Tanaica
## Env file

On startup, Tanaica will read the file at ´~/.config/tanaica/env´ and export all the variables contained in it as environment variables. These variables are used to configure some of the components:

### Status information
Polybar and its supporting scripts will read some information from environment variables, namely ´WLAN_DEVICE´ to know which device's information should be displayed, ´BATTERY´ and ´ADAPTER´ to know which battery to look at.

This is what I inserted for my Thinkpad into the ´env´ file:

´´´
WLAN_DEVICE=wlp0s20f3
BATTERY=BAT0
ADAPTER=ADP0
´´´

### Unsplash background fetcher
The script located at ´~/.scripts/unsplash.py´ will look for an environment variable called ´UNSPLASH_CLIENT_ID´. This is the API key from unsplash and will be used to fetch a new background. If you have an unsplash API key, insert it there.

## Xresources
The file ´~/.config/tanaica/Xresources´ contains a number of theme definitions that are used all around Tanaica. On startup, all resources are read from this file using ´xrdb -load´ and then inserted as environment variables as well. This means, that both the x-resource ´background´ and the environment variable ´$background´ will contain the same hex color.

These resources are then used everywhere a script needs access to the colors with just the environment variables.
