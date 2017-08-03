#
# Cookbook Name:: yum
# Recipe:: default
#
# Copyright 2015, Aucfan Co., Ltd.
#
# All rights reserved - Do Not Redistribute
#

#remote_file "#{Chef::Config[:file_cache_path]}/epel-release-7.rpm" do
#  source "http://mirrors.digipower.vn/fedora/epel/7/x86_64/e/epel-release-7-5.noarch.rpm"
#  action :create
#end
#rpm_package "epel-release-7" do
#  source "#{Chef::Config[:file_cache_path]}/epel-release-7.rpm"
#  action :install
#end

yum_package 'git'
yum_package 'gcc'
yum_package 'bind-utils'
#yum_package 'ntp' do
#  action :remove
#end
yum_package 'chrony'
yum_package 'epel-release'
# yum_package 'htop'
yum_package 'libxml2-devel'
yum_package 'libxslt'
yum_package 'libxslt-devel'
yum_package 'mlocate'
yum_package 'openssl-devel'
yum_package 'pcre-devel'
yum_package 'readline-devel'
yum_package 'tcpdump'
yum_package 'telnet'
# yum_package 'tig'
yum_package 'traceroute'
yum_package 'zlib-devel'

# Other Possible yum packages:
#    gd
#    gd-devel
#    libpng
#    libpng-devel
#    libjpeg-turbo
#    libjpeg-turbo-devel

