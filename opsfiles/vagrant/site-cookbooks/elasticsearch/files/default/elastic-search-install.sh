#!/bin/sh

yum -y install java
rpm --import https://packages.elasticsearch.org/GPG-KEY-elasticsearch
yum -y install elasticsearch
chkconfig  elasticsearch on

#Verify
ss -an | grep 9200 

##### Plugin 
PATH_PLUGIN="/usr/share/elasticsearch/bin/plugin"
echo $PATH_PLUGIN
#Kuromoji
$PATH_PLUGIN install elasticsearch/elasticsearch-analysis-kuromoji/2.4.2 

#HQ
$PATH_PLUGIN install royrusso/elasticsearch-HQ

#Inquisitor - debug your queries in ElasticSearch
$PATH_PLUGIN install polyfractal/elasticsearch-inquisitor

#Restart
service elasticsearch restart
#elasticsearch-mysql-importer

yum install -y ruby ruby-devel mysql-devel
gem install bundle
gem install mysql2 -v '0.3.18'
git clone https://github.com/y-ken/elasticsearch_mysql_importer.git
cd elasticsearch_mysql_importer/
bundle install --path vendor/bundle


#vim example/example.rb ## See the attached file!!
#Create database for test
echo 'drop database if exists mysqltest' | mysql -uroot
echo 'create database mysqltest' | mysql -uroot
mysql -uroot mysqltest < example/example_table.sql

sed -i -e "s/your_mysql_username/root/g" example/example.rb
sed -i -e "s/your_mysql_password//g" example/example.rb
sed -i -e "s/some_database/mysqltest/g" example/example.rb


curl -s -XPOST localhost:9200/_bulk --data-binary @example/requests.json