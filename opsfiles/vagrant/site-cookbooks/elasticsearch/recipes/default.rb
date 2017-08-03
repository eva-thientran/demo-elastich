#
# Cookbook Name:: elasticsearch
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

cookbook_file "elastic-search-install.sh" do
  path "/tmp/elastic-search-install.sh"
  owner "root"
  group "root"
  mode 0755
  action :create
end

cookbook_file "/etc/yum.repos.d/Elasticsearch.repo" do
  source "Elasticsearch.repo"
  owner "root"
  group "root"
  mode 0644
end

bash 'Install elasticsearch' do
  user 'root'
  cwd "/tmp"
  code <<-EOH
  ./elastic-search-install.sh
  EOH
end
