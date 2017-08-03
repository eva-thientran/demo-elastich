#!/bin/sh
#Todo remove it if recipe firewalld working
echo "add firewall rule"
firewall-cmd --permanent --zone=public --add-service=http
#add rule for elasticsearch
firewall-cmd --permanent --zone=public --add-port=9200/tcp
echo "restart firewall, nginx, php-fpm"

service firewalld.service restart
service nginx restart
service php-fpm restart

# echo "Install vendor php via composer"
# cd /deploy/naniwa-eval
# php composer.phar install --no-ansi \
# 	--no-dev --no-interaction \
# 	--no-progress --no-scripts --optimize-autoloader

echo "Disable SELinux in devsite"
setenforce  0