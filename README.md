# Macsible

[![Build Status](https://travis-ci.org/danbohea/macsible.svg?branch=master)](https://travis-ci.org/danbohea/macsible)

> **Disclaimer**: This is still a fairly opinionated project. Attempts to make it more flexible are ongoing, but for now please consider it work in progress for my personal use.

- **Currently**, Macsible is the current state of the playbook that I use to setup 2 different Macs. It uses various Ansible Galaxy roles to achieve that (search Ansible Galaxy for [roles tagged "macsible"](https://galaxy.ansible.com/list#/roles?page=1&page_size=10&tags=macsible)).
- **Eventually**, Macsible will be a fairly unopinionated framework for other people to do the same.
- **In the meantime**, feel free to fork, raise issues etc. I'd love to hear people's thoughts.


### Requirements

Ensure the following requirements are already installed and working:

- macOS 10.11 (El Capitan)
- Command Line Developer Tools

See [here](docs/install_requirements.md) for assistance.


### Install dependencies

A script is included to ensure certain dependencies are met:

- Install Homebrew
- Install separate Python (via Homebrew)
- Install Ansible (via Homebrew)
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
- [Stage by stage installation using tags](docs/tags_stages.md)
