#!/usr/bin/env bash
systemctl stop nginx
rm -rf /var/www/html/*
git clone https://github.com/Bryce-huang/Bryce-huang.github.io.git /var/www/html
systemctl start nginx
