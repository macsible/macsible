#!/bin/bash

DIR="$(dirname "$0")"
. "$DIR/common.sh"

# Create requirements.yml
setStatusMessage "Creating requirements.yml if absent"
cp -n ../src/requirements.example.yml ../requirements.yml

# Create mac-custom.yml
setStatusMessage "Creating mac-custom.yml if absent"
cp -n ../src/mac-custom.example.yml ../mac-custom.yml

# Create config.yml
setStatusMessage "Creating config.yml if absent"
cp -n ../src/config.example.yml ../config.yml

# Create config.local.yml
setStatusMessage "Creating config.local.yml if absent"
cp -n ../src/config.example.yml ../config.local.yml
