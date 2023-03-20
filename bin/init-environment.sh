#!/bin/bash

set -e

## Environment: localdomain
thisone=localdomain

cd $HOME/inventory
rm environment
ln -s $thisone environment
cd $HOME/

find $HOME/ -type d -exec chmod 755 {} \;
find $HOME/ ! -name '*.sh' -type f -exec chmod 644 {} \;
find $HOME/ -name '*.sh' -type f -exec chmod 744 {} \;
find $HOME/ -name 'id_rsa*' -type f -exec chmod 600 {} \;

if ! command -v pip3 >/dev/null; then
  echo "Installing pip3"
  if command -v sudo >/dev/null; then
    if command -v apt-get >/dev/null; then
      sudo apt-get update
      sudo apt-get -y install python3-pip
    fi
    if command -v dnf >/dev/null; then
      sudo dnf -y install python3-pip
    fi
    if command -v yum >/dev/null; then
      sudo yum -y install python3-pip
    fi
  else
    echo "sudo command not found!"
    exit 1
  fi
fi

if command -v pip3 >/dev/null; then
  echo "Installing pip3 requirements"
  python3 -m pip install --upgrade -user pip
  python3 -m pip install --user --requirement $HOME/requirements.txt
fi

if [ ! -f ${HOME}/.ssh/ssh_agent_setup ]; then
  echo "Creating .ssh_agent_setup file..."
  cat <<EOF > ${HOME}/.ssh/ssh_agent_setup
#!/bin/bash
if [[ -z "\$SSH_AGENT_PID" || ! -e "/proc/\$SSH_AGENT_PID" ]]; then
  eval "$(ssh-agent -s)" 
fi
EOF
fi
if [ ! grep -qxF "source ${HOME}/.ssh/ssh_agent_setup" "${HOME}/.bashrc" ]; then
  echo -e "\nsource ~/.ssh/ssh_agent_setup" >> "${HOME}/.bashrc"
fi

source ${HOME}/.bashrc
