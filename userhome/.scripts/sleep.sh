#/bin/sh

# lock keepass xc databases
dbus-send --print-reply --dest=org.keepassxc.KeePassXC.MainWindow /keepassxc org.keepassxc.MainWindow.lockAllDatabases

# go to sleep
systemctl suspend
