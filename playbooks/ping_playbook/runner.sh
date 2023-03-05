#!/bin/bash

# set -x
# set -e

GROUP_PLAYBOOK=ping.yml
PYTHONUNBUFFERED=1

ansible-playbook --verbose --ask-vault-pass $GROUP_PLAYBOOK
