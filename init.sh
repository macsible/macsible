#!/bin/bash

# This file ensures that Ansible and any dependencies are in place.

# Prerequisites: See README.md

# Credits:
# - https://github.com/superlumic/superlumic/blob/master/superlumic

# ------------------------------------------------------------------------------

# Vars
# ------------------------------------------------------------------------------

BGreen='\e[1;32m' # Green
BRed='\e[1;31m'   # Red
Color_Off='\e[0m' # Text Reset

# Functions
# ------------------------------------------------------------------------------

function setStatusMessage {
    printf "${IRed} --> ${BGreen}$1${Color_Off}\n" 1>&2
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

setStatusMessage "Keep-alive: update existing sudo time stamp until we are finished"

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install pip
if ! exists pip; then
    setStatusMessage "Install pip"
    sudo easy_install --quiet pip
fi

# Install Ansible
if ! exists ansible; then
    setStatusMessage "Install Ansible"
    sudo pip install -q ansible
fi

# Install Ansible Galaxy dependencies:
ansible-galaxy install -r requirements.yml
