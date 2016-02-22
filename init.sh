#!/bin/bash

# This file ensures that Ansible and any dependencies are in place.
# Only run this file once.

# Prerequisites: See README.md

# ------------------------------------------------------------------------------

# Install pip
sudo easy_install pip

# Install Ansible
# Keep this at 1.9.4 until the following issue is resolved:
# https://github.com/ansible/ansible-modules-core/issues/2473
sudo pip install ansible==1.9.4

# Install Ansible Galaxy dependencies:
ansible-galaxy install -r deps.yml

# Install Homebrew (avoids prompt) http://stackoverflow.com/a/25535532
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null
# Check for any issues with Homebrew installation
brew doctor

# Disable smart quotes & smart dashes in TextEdit before editing any files
defaults write com.apple.TextEdit SmartQuotes -bool false
defaults write com.apple.TextEdit SmartDashes -bool false

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Restart Finder
killall Finder
