# ansible-setup
Configuration management for my systems using Ansible

Currently only supports Arch Linux

# Instructions
To run the playbook,cd into the playbook's directory and use the following command:
`ansible-playbook site.yml --ask-become-pass`

To run only a section of the configuration, for example: to copy only the MPD configuration files, make use of the --tags flag
`ansible-playbook site.yml --tags mpd`
