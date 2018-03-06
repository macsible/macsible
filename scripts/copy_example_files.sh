#!/bin/bash

# Include ../common.sh
DIR="$(dirname "$0")"
. "$DIR/common.sh"

# Terminate as soon as any command fails.
set -e

# Change to project root directory
cd "$DIR"
cd ../

# Copy and rename files & directories from ./examples

# We're using `rsync` instead of `cp` because for some reason Travis now fails
# when using `cp -n` (it's the `-n` it doesn't like).
# https://github.com/travis-ci/travis-ci/issues/6307#issuecomment-363899104

setStatusMessage "Creating ./ansible.cfg if absent"
rsync examples/ansible.cfg ansible.cfg --ignore-existing

setStatusMessage "Creating ./config.yml if absent"
rsync examples/config.yml config.yml --ignore-existing

setStatusMessage "Creating ./config.local.yml if absent"
rsync examples/config.yml config.local.yml --ignore-existing

setStatusMessage "Creating ./custom-playbooks if absent"
mkdir -p custom-playbooks

setStatusMessage "Creating ./inventory.yml if absent"
rsync examples/inventory.yml inventory.yml --ignore-existing

setStatusMessage "Creating ./custom-playbooks/mac.yml if absent"
rsync examples/mac.yml custom-playbooks/mac.yml --ignore-existing

setStatusMessage "Creating ./requirements.yml if absent"
rsync examples/requirements.yml requirements.yml --ignore-existing
