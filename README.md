# ansible-setup
Configuration management for my systems using Ansible

Currently only supports Arch Linux

# Instructions
This playbook is **only meant to be run as the local user on the localhost AFTER INSTALLATION**, as I'm just symlinking the home directory config files to their respective locations.
So to do that, you need to edit your inventory file (/etc/ansible/hosts) and add the following:

`localhost ansible_connection=local ansible_python_interpreter=/usr/bin/python2`

To run the playbook,cd into the playbook's directory and use the following command:
`ansible-playbook site.yml --ask-become-pass`

To run only a section of the configuration, for example: to copy only the MPD configuration files, make use of the --tags flag
`ansible-playbook site.yml --tags mpd`
