# Mac playbook

[![Build Status](https://travis-ci.org/danbohea/mac-playbook.svg?branch=master)](https://travis-ci.org/danbohea/mac-playbook)

> **Disclaimer**: This is still a fairly opinionated project. Attempts to make it more flexible are ongoing, but for now please consider it work in progress for my personal use.

### Requirements

Ensure the following requirements are already installed and working:

- Mac OS 10.11 (El Capitan)
- Xcode
- Command Line Developer Tools

See [here](docs/install_requirements.md) for assistance.


### Install dependencies

A script is included to ensure certain dependencies are met:

- Install pip
- Install Ansible
- Download required Ansible Galaxy roles
- Create a config.yml file (required)

To execute this script run:

```
bash init.sh
```


### Configure

Default variables can be overridden in config.yml.


### Run the Ansible playbook

The mac.yml Ansible playbook can be run using the following command:

```
ansible-playbook mac.yml -K
```

To run only certain tags (e.g. `evernote` and `moom`):

```
ansible-playbook mac.yml -K -t "evernote,moom"
```

### Further docs

- [Installing requirements](docs/install_requirements.md)
- [Staged installation using tags](docs/tags_stages.md)
