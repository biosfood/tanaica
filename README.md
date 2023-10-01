# Tanaica

i3-based linux configurations for a peaceful setup experience

## Entymology

This project is named after the [Tanaica Montes](https://en.wikipedia.org/wiki/Tanaica_Montes), a martian mountain range.

## Installation

### Into existing Installation

To install the files into your currently used installation, just run the installation script:

``` ./install.sh files ```

This will copy all the configuration files in the repository into their respective folders.

To leave out or just copy a few select files, modify the `files` file which contains references to all synchronized files accordingly.

## Development

To sync the configuration files of your user to the repository, run `./sync-files.sh files`. When commiting, make sure only the files you want to have changed in the repository are actually added.
