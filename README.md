# Tanaica

i3-based linux configurations for a peaceful setup experience

## Setup
For a complete setup guide, look at the setup.md file in the ´docs´ directory.

## Entymology

This project is named after the [Tanaica Montes](https://en.wikipedia.org/wiki/Tanaica_Montes), a martian mountain range.

## Dependencies

All dependencies for this repository are listed in `dependencies`. To install all of them, use your favourite AUR-helper (here paru) like this and install all the packages:

```
cat dependencies | paru -S -
```

## Installation

### Into existing Installation

To install the files into your currently used installation, just run the installation script:

```
./install.sh
```

This will copy all the configuration files in the repository into their respective folders.

## Development

To sync the configuration files of your user to the repository, run `./sync-files.sh files`. When commiting, make sure only the files you want to have changed in the repository are actually added.

When adding dotfiles for an additional programm or generally suggesting a new dependency, add its AUR name to the `dependencies` file.

Konsole likes to regularly mess up configurations. Because of this, it is highly reccommended you run `git update-index --skip-worktree userhome/.config/konsolerc` after initializing the repository and be careful what changes are committed.

## Customization

If you want to customize your installation, it is highly reccomenden you fork this project and track your own changes from there. If you think some of the changes you made are worth distributing to all users of this project, please use `git cherry-pick` on a new branch and please open a pull request. All improvements are welcome.

## Utility scripts:

The directory `~/.scripts/` contains a number of small utility scripts do do useful stuff from the command line without having to remember as many commands.

## Installing lib32-packages:
If you want to install packages of the form ´lib32-XXX´, you need to activate the ´multilib´ repository in ´/etc/pacman.conf´ first!

## Theming

To change the desktop theme for window borders, open `lxappearance` and select the theme you want.
