#!/usr/bin/env bash

# update apt
sudo apt-get update
sudo apt-get upgrade

# install java
sudo apt-get purge openjdk*
sudo apt-get install openjdk-7-jre-headless -y

# install elasticsearch
wget https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/2.4.1/elasticsearch-2.4.1.deb
sudo dpkg -i elasticsearch-2.4.1.deb

# change elasticsearch configuration
sudo echo "network.host: 0.0.0.0" >> /etc/elasticsearch/elasticsearch.yml
sudo echo "http.enabled.cors: true" >> /etc/elasticsearch/elasticsearch.yml

#start the elasticsearch service
sudo service elasticsearch start

# install nodejs
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs

# install git
sudo apt-get install git -y

# clean directory for epicsearch clone
rm -rf /home/vagrant/epicsearch

# clone latest code from git
cd /home/vagrant/epicsearch
git clone https://github.com/Mindgreppers/epicsearch.git .

# install packages
npm install
