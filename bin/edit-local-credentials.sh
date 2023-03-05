#!/bin/bash

export CREDENTIALS="$HOME/inventory/environment/group_vars/all/credentials.yml"

create_credentials() {
  cat > $CREDENTIALS <<EOF
---

group_vars_linux_user: 'uid'
group_vars_linux_password: ''
group_vars_linux_become_user: 'root'
group_vars_windows_user: 'user@ad.domain.name'
group_vars_windows_password: ''
group_vars_windows_become_user: 'System'
EOF
}

if ! [ -x "$(command -v ansible-vault)" ]; then
  echo 'Error: ansible-vault is not installed.' >&2
  exit 1
fi

if [ ! -s $CREDENTIALS ]; then
  create_credentials
fi

if [ -s $CREDENTIALS ]; then
  chmod 600 $CREDENTIALS
  head -1 $CREDENTIALS | grep -v -q \$ANSIBLE_VAULT && \
  echo -e "\nEncrypting: $CREDENTIALS" && \
  ansible-vault encrypt $CREDENTIALS
  echo -e "\nEditing: $CREDENTIALS" && \
  ansible-vault edit $CREDENTIALS
  chmod 400 $CREDENTIALS
fi
