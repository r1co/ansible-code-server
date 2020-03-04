#!/bin/bash

# configure git user
if test ! -z "$GLOBAL_GIT_USER"
then
  echo "configure git user.name "
  sudo -iu ansible git config --global user.name "$GLOBAL_GIT_USER"
fi
# configure git mail
if test ! -z "$GLOBAL_GIT_MAIL"
then
  echo "configure git user.email "
  sudo -iu ansible git config --global user.email "$GLOBAL_GIT_MAIL"
fi

# install extensions
echo "installing extensions..."
sudo -iu ansible code-server  --user-data-dir /home/ansible/.vscode-data --install-extension gabrielgrinberg.auto-run-command
sudo -iu ansible code-server  --user-data-dir /home/ansible/.vscode-data --install-extension chrmarti.ssh

# start services
echo "start services..."
/usr/bin/supervisord
