#
# Cookbook Name:: phalcon
# Recipe:: default
#
# Copyright 2015, Aucfan Co., Ltd.
#
# All rights reserved - Do Not Redistribute
#
#To do later
=begin

execute "install re2c" do
  user "root"
  command <<-EOL
    cd /usr/local/src
    rm -rf re2c-0.13.7.5
    wget http://sourceforge.net/projects/re2c/files/re2c/0.13.7.5/re2c-0.13.7.5.tar.gz
    tar xvzf re2c-0.13.7.5.tar.gz
    cd re2c-0.13.7.5
    ./configure
    make && make install
  EOL
end

execute "install json-c" do
  user "root"
  command <<-EOL
    cd /usr/local/src
    rm -rf json-c
    git clone https://github.com/json-c/json-c.git
    cd json-c
    sh autogen.sh
    ./configure
    make && make install
  EOL
end

execute "install zephir" do
  user "root"
  command <<-EOL
    cd /usr/local/src
    rm -rf zephir
    git clone https://github.com/phalcon/zephir
    cd zephir
    ./install -c
  EOL
end

execute "install cphalcon" do
  user "root"
  command <<-EOL
    git clone http://github.com/phalcon/cphalcon
    cd cphalcon
    git checkout 2.0.0
    cd ext/
    ./install
  EOL
end

=end

execute "install cphalcon" do
  user "root"
  command <<-EOL
    git clone --depth=1 http://github.com/phalcon/cphalcon
    cd cphalcon
    cd ext/
    ./install
  EOL
end
template "/etc/php.d/phalcon.ini" do
  source "phalcon.ini.erb"
  mode "0644"
#  notifies :restart, "service[httpd]"
end
