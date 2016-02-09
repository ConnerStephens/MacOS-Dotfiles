#!/bin/bash 

echo "Beginning installation of Rails for Ubuntu 14.04"
sudo apt-get update
sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
echo "Doing wget Stuff!"
wget http://ftp.ruby-lang.org/pub/ruby/2.2/ruby-2.2.3.tar.gz
tar -xzvf ruby-2.2.3.tar.gz
pushd "ruby-2.2.3/"
./configure
make
sudo make install
popd
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
sudo gem install bundler
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo gem install rails
echo "Complete!"
