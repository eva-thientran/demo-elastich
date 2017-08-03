#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# cookbook_file "MariaDB.repo" do
#   owner 'root'
#   group 'root'
#   path "/etc/yum.repos.d/MariaDB.repo"
#   action :create
# end

cookbook_file "/etc/yum.repos.d/MariaDB.repo" do
  source "MariaDB.repo"
  owner "root"
  group "root"
  mode 0644
end

# yum_repository 'mariadb' do
#   description 'Extra Packages for Enterprise Linux'
#   baseurl 'http://yum.mariadb.org/10.0/centos7-amd64'
#   gpgkey 'https://yum.mariadb.org/RPM-GPG-KEY-MariaDB'
#   action :create
# end

execute "install MariaDB" do
  user "root"
  command <<-EOL
    yum -y install MariaDB-server MariaDB-client
  EOL
end

service "mysql" do
  action :start
end
