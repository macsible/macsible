#!/bin/bash

# This file ensures that Ansible and any dependencies are in place.

# Prerequisites: See README.md

# Credits:
# - https://github.com/superlumic/superlumic/blob/master/superlumic

# ------------------------------------------------------------------------------

# Vars
# ------------------------------------------------------------------------------

BGreen='\e[1;32m' # Green
Color_Off='\e[0m' # Text Reset

# Functions
# ------------------------------------------------------------------------------

function setStatusMessage {
  printf " --> ${BGreen}$1${Color_Off}\n" 1>&2
}

# Install
# ------------------------------------------------------------------------------

# Install pip
setStatusMessage "Installing/upgrading pip"
sudo easy_install pip

# Install setuptools
# http://stackoverflow.com/a/36987168
setStatusMessage "Installing setuptools"
pip install --upgrade setuptools --user python

# Install Ansible
setStatusMessage "Installing Ansible"
sudo pip install ansible

# Install Ansible Galaxy dependencies:
setStatusMessage "Installing Ansible role dependencies"
ansible-galaxy install -r requirements.yml

# Create config.yml
setStatusMessage "Creating config.yml if absent"
cp -n config_example.yml config.yml
