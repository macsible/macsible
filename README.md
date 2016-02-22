# Mac playbook

[![Build Status](https://travis-ci.org/danbohea/mac-playbook.svg?branch=master)](https://travis-ci.org/danbohea/mac-playbook)

## First time install & run

1) Install Xcode from the App Store. When installed, launch Xcode and agree the policy prompt.

2) Install Xcode command line developer tools. You will need to interact with the prompts that follow: Install > Agree > Done.

    xcode-select --install

3) Clone repo into place and `cd` to its working directory:

    git clone https://github.com/danbohea/mac-playbook.git ~/Projects/internal/mac-playbook && cd mac-playbook/

4) Run initial setup file:

    bash init.sh

5) Run Ansible playbook (preparatory tasks only):

    ansible-playbook -i hosts main.yml -K --tags "prep" --limit [hostname]

6) Ensure that any external settings files are present (e.g. Dropbox is setup & required files are synced).

6) Ensure required SSH keys are in place at ~/.ssh/

7) Run Ansible playbook (skipping preparatory tasks):

    ansible-playbook -i hosts main.yml -K --skip-tags "prep" --limit [hostname]


## Running the playbook again

To run the whole playbook again you simply remove any tag options:

    ansible-playbook -i hosts main.yml -K --limit [hostname]

To run only certain tags again:

    ansible-playbook -i hosts main.yml -K --limit [hostname] -t "tag1, tag2"
