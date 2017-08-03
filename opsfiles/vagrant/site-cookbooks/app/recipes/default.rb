#
# Cookbook Name:: app
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

cookbook_file "script.sh" do
  path "/tmp/script.sh"
  action :create
  mode 0755
end

bash 'Restart all app' do
  user 'root'
  cwd "/tmp"
  code <<-EOH
  ./script.sh
  EOH
end
