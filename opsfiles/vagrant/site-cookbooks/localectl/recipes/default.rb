#
# Cookbook Name:: localectl
# Recipe:: default
#
# Copyright 2015, Aucfan Co., Ltd.
#
# All rights reserved - Do Not Redistribute
#
bash 'localectl' do
  code 'localectl set-locale LANG=ja_JP.UTF-8'
end
