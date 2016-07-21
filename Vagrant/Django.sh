#!/bin/bash

####################
# Install Commands #
####################

sudo apt-get update
sudo apt-get install python-pip
sudo apt-get install python3-pip
sudo pip install virtualenv
sudo pip3 install virtualenv
mkdir ~/Django
pushd "~/Django"
virtualenv -p python3 devops
source devops/bin/activate
sudo pip3 install django

################
# Set-Up Notes #
################

# To Reactivate
# -------------

# cd ~/newproject
# source newenv/bin/activate

# To Exit:
# --------

# deactivate
