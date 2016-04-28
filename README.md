# Macsible

[![Build Status](https://travis-ci.org/danbohea/macsible.svg?branch=master)](https://travis-ci.org/danbohea/macsible)

> **Disclaimer**: This is still a fairly opinionated project. Attempts to make it more flexible are ongoing, but for now please consider it work in progress for my personal use.

### Requirements

Ensure the following requirements are already installed and working:

- Mac OS 10.11 (El Capitan)
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

The primary Ansible playbook file is called mac.yml and can be run using the following command (asks for sudo password):

```
ansible-playbook mac.yml -K
```

To run only certain tags (e.g. `evernote` and `moom`):

```
ansible-playbook mac.yml -K -t "evernote,moom"
```

You can see a full list of available tags by running the following command (Galaxy roles must be downloaded first, run `bash init.sh` if uncertain):

```
ansible-playbook mac.yml --list-tags
```

### Further docs

- [Installing requirements](docs/install_requirements.md)
- [Staged installation using tags](docs/tags_stages.md)
