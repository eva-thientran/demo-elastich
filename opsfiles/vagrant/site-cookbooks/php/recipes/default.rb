#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2015, Aucfan Co., Ltd.
#
# All rights reserved - Do Not Redistribute
#

execute "remove php packages" do
  user "root"
  command <<-EOL
    yum -y erase php54-*
    yum -y erase php55u-*
    yum -y erase php-*
  EOL
end

execute "install php56-remi" do
  user "root"
  command <<-EOL
    yum -y install --enablerepo=remi, remi-php56 \
    php\
    php-common\
    php-fpm\
    php-devel \
    php-gd \
    php-intl \
    php-mbstring \
    php-mcrypt \
    php-mysqlnd \
    php-opcache \
    php-pdo \
    php-pecl-apcu \
    php-pecl-xdebug \
    php-pear \
    php-xml
  EOL
end

#tun on Dispaly error
execute "add config php" do
  user "root"
  command <<-EOL
    sed -i -e "s/display_errors = Off/display_errors = On/g" /etc/php.ini
  EOL
end

#config php-fpm
template "/etc/php-fpm.d/www.conf" do
  source "www.conf.erb"
  variables(
    :user => node["user"]["name"],
    :application_env => node["app"]["env"]
  )
end

service "php-fpm" do
  supports :status => true, :restart => true, :reload => true
  action [:start, :enable]
end
