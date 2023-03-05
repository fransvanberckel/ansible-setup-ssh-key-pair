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
~/ $ ls playbooks roles
```
Setup the localhost environment
```
~/ $  cd playbooks/localhost_playbook
~/playbooks/localhost_playbook/ $  ./runner.sh
~/playbooks/localhost_playbook/ $  cd
~/ $
```
