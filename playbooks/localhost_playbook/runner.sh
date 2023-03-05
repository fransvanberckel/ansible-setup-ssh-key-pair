#!/bin/bash

# set -x
# set -e

# GROUP_PLAYBOOK=$1
GROUP_PLAYBOOK=localhost.yml
PYTHONUNBUFFERED=1

if ! command -v ansible >/dev/null; then

        echo "Installing Ansible"

        if command -v sudo >/dev/null; then

                if command -v apt-get >/dev/null; then

                        sudo apt-get update
                        sudo DEBIAN_FRONTEND=noninteractive apt-get --yes install ansible

                else
                        echo "apt-get command not found!"
                        exit 1

                fi

        else

                echo "sudo command not found!"
                exit 1

        fi
else

ansible-playbook --verbose --ask-vault-pass $GROUP_PLAYBOOK

fi
