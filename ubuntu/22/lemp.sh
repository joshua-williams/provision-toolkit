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
# add non-root user
useradd -m -s /bin/bash felix