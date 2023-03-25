# ansible-setup-ssh-key-pair
Ansible: Setup SSH key pair with passphrase
```
~/ $ whoami

ansible

~/ $ pwd

/home/ansible
```
With a dot at the end, git clone the repository into home directory.
```
~/ $ git clone https://github.com/fransvanberckel/ansible-setup-ssh-key-pair.git .
```
Initialize the environment
```
~/ $  cd bin
~/bin/ $  chmod +x init-environment.sh
~/bin/ $  ./init-environment.sh
~/bin/ $  ./edit-local-credentials.sh
~/bin/ $ cd
~/ $ tree playbooks roles

playbooks
├── configure_ssh_playbook
│   ├── configure_ssh.yml
│   └── runner.sh
├── localhost_playbook
│   ├── localhost.yml
│   └── runner.sh
└── ping_playbook
    ├── ping.yml
    └── runner.sh

roles
├── localhost_role
│   └── tasks
│       └── main.yml
├── openssh_keypair_role
│   └── tasks
│       └── main.yml
├── ping_role
│   └── tasks
│       └── main.yml
├── setup_users_role
│   └── tasks
│       └── main.yml
└── win_ping_role
    └── tasks
        └── main.yml
```
Setup SSH key-pair
```
~/ $  cd playbooks/localhost_playbook
~/playbooks/localhost_playbook/ $ ./runner.sh
~/playbooks/localhost_playbook/ $ cd ../configure_ssh_playbook
~/playbooks/configure_ssh_playbook/ $ ./runner.sh
~/playbooks/configure_ssh_playbook/ $ cd
~/ $
```
host_vars/*/credentials.yml: Switch to group_vars_linux_passphrase

And run Ping playbook to verify
```
~/ $  cd playbooks/ping_playbook
~/playbooks/ping_playbook/ $ ./runner.sh
~/playbooks/ping_playbook/ $ cd
~/ $
```
