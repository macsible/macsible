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

# Check whether a command exists - returns 0 if it does, 1 if it does not
function exists {
  if command -v $1 >/dev/null 2>&1
  then
    return 0
  else
    return 1
  fi
}

# Install
# ------------------------------------------------------------------------------

# Create config.yml
setStatusMessage "Creating config.yml if absent"
cp -n config_example.yml config.yml

# Install pip
if ! exists pip; then
    setStatusMessage "Installing pip"
    sudo easy_install pip
fi

# Install setuptools
# http://stackoverflow.com/a/36987168
if ! exists setuptools; then
    setStatusMessage "Installing setuptools"
    pip install --upgrade setuptools --user python
fi

# Install Ansible
if ! exists ansible; then
    setStatusMessage "Installing Ansible"
    sudo pip install ansible
fi

# Install Ansible Galaxy dependencies:
setStatusMessage "Installing Ansible role dependencies"
ansible-galaxy install -r requirements.yml

setStatusMessage "Initial setup complete"
