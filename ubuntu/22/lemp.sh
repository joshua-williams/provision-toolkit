#!/usr/bin/env bash

apt update
apt install nginx -y
# enable ufw firewall
ufw enable -y
# open firewall port 80
ufw allow 'Nginx HTTP'
apt install mysql-server -y
# install php 8
apt install php8.1-fpm php-mysql -y
# add felix devops user
useradd -m -s /bin/bash -G sudo felix
# make is so that felix does not have to call sudo for admin commands
echo "felix ALL=(ALL:ALL) ALL" > /etc/sudoers.d/felix
# Make felix .ssh directory if not exists
if [[ !-d /home/felix/.ssh ]]; then
  mkdir /home/felix/.ssh
fi
# copy ssh key to felix user
cp ~/.ssh/authorized_keys /home/felix/.ssh
chown -R felix:felix /home/felix/.ssh
# Create felix mysql user
mysql -e "CREATE USER 'felix'@'localhost'"
mysql -e "GRANT ALL ON *.* TO 'felix'@'localhost'"
mysql -e "FLUSH PRIVILEGES"