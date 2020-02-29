#!/bin/bash

echo "installing extensions..."
code-server  --user-data-dir /home/ansible/.vscode-data --install-extension gabrielgrinberg.auto-run-command
code-server  --user-data-dir /home/ansible/.vscode-data --install-extension chrmarti.ssh

echo "start code-server..."
dumb-init code-server --host 0.0.0.0 --user-data-dir /home/ansible/.vscode-data /home/ansible/playbooks/ansible.code-workspace

