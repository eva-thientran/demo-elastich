#
# Cookbook Name:: firewalld
# Recipe:: default
#
# Copyright 2015, Aucfan Co., Ltd.
#
# All rights reserved - Do Not Redistribute
#
firewalld_service 'http' do
  action :add
  zone 'public'
end

execute "restart firewalld" do
  user "root"
  command <<-EOL
    firewall-cmd --permanent --zone=public --add-service=http
    systemctl restart firewalld.service
  EOL
end
