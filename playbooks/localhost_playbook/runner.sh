#!/bin/bash

# set -x
# set -e

GROUP_PLAYBOOK=localhost.yml
PYTHONUNBUFFERED=1

ansible-galaxy collection install community.general
ansible-playbook --verbose --ask-vault-pass $GROUP_PLAYBOOK
