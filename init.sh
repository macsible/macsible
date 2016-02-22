#!/bin/bash

# This file ensures that Ansible and any dependencies are in place.
# Only run this file once.

# Prerequisites: See README.md

# ------------------------------------------------------------------------------

# Install pip
sudo easy_install pip

# Install Ansible
# This is the "less noisey" technique for installing Ansible on Mac OS 10.9+
# http://docs.ansible.com/ansible/intro_installation.html#latest-releases-via-pip
- sudo CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments pip install ansible==1.9.4

# Install Ansible Galaxy dependencies:
ansible-galaxy install -r deps.yml

# Install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# Check for any issues with homebrew installation
brew doctor

# Disable smart quotes & smart dashes in TextEdit before editing any files
defaults write com.apple.TextEdit SmartQuotes -bool false
defaults write com.apple.TextEdit SmartDashes -bool false

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Restart Finder
killall Finder
