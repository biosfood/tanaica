sudo pacman -S postgresql
sudo systemctl start postgresql
# If the systemctl command errors, then run the following
sudo mkdir /var/lib/postgres/data
sudo chown postgres:postgres /var/lib/postgres/data
sudo -u postgres initdb -D /var/lib/postgres/data
sudo systemctl start postgresql
