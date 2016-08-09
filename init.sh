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

# Install Homebrew
if ! exists brew; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew
brew update

# Install Python, separate from version that ships with OS X
brew install python

#  Install Ansible
if ! exists ansible; then
  brew install ansible
fi

# Install Ansible Galaxy dependencies:
setStatusMessage "Installing required Ansible Galaxy roles"
ansible-galaxy install -r requirements.yml --force

# Create config.yml
setStatusMessage "Creating config.yml if absent"
cp -n config_example.yml config.yml
