#!/bin/bash

set -e

## Environment: localdomain
thisone=localdomain

cd $HOME/inventory
ln -sf $thisone environment
cd $HOME/

find $HOME/ -type d -exec chmod 755 {} \;
find $HOME/ ! -name '*.sh' -type f -exec chmod 644 {} \;
find $HOME/ -name '*.sh' -type f -exec chmod 744 {} \;
find $HOME/ -name 'id_rsa*' -type f -exec chmod 600 {} \;

