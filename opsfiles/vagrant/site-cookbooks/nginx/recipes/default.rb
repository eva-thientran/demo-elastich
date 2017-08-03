#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#

execute "install nginx" do
  user "root"
  command <<-EOL
    yum -y install nginx
  EOL
end

template "/etc/nginx/nginx.conf" do
  source "nginx.conf.rb"
end


directory "/etc/nginx/vhost" do
  owner "root"
  group "root"
  mode 0755
  action :create
end

template "/etc/nginx/vhost/elastich.conf" do
  source "elastich.conf.rb"
  variables({ :doc_root => node['app']['web_dir'], :domain => node['app']['domain'] })
end

#  variables({ :doc_root => node['app']['domain'] })


service "nginx" do
  supports :status => true, :restart => true, :reload => true
  action [:start, :enable]
end

