# Setup guide

This is a setup guide to hopefully help with setting up an arch linux installation and getting ready to install Tanaica

## Network manager
Make sure to select ´NetworkManager´ to manage your network connections in the ´archinstall´ wizzard. The Polybar wifi section needs this to work correctly.

## Nvchad
https://nvchad.com/ is a group of neovim setup files I quite like. Tanaica comes with an additional `plugins.lua` file to add some more funcitonality.

To install Nvchad, run the command `git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim`. Make sure the folder `~/.config/nvim` doesn't exist before doing this.
