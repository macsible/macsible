# Staged installation using tags

The roles listed in the mac.yml playbook have been tagged so that they can be run individually or in groups (stages):

- prep
- stage_1
- stage_2
- stage_3
- stage_4
- stage_5

Stages are used to group roles by priority and purpose:

### prep

Roles required to run very early on in order to provide helpful config and tools that *may* be required before running any more of the playbook. For example:

- a better text editor
- access to synchronised file storage where app preferences may be stored (e.g. Dropbox)

### stage_1

Essential day-to-day apps & config.

### stage_2

Essential development tools.

### stage_3

Project work (e.g. folder structures, cloned git repos).

### stage_4 & stage_5

Remaining lower priority apps. Travis CI skips `stage_5` to help speed up tests by not bothering to install non-critical apps whose installation is very simple.

### last

Roles that must be run after other roles. These are typically roles that need to assess what apps have been installed before they can perform any actions (such as adding items to the Dock).
