#  Ansible in VSCode 

Manage ansible playbooks in  [code-server](https://github.com/cdr/code-server). 

For configuration of code-server check out  [code-server repo](https://github.com/cdr/code-server). 

## Run
```shell script
docker run -it -p 127.0.0.1:8080:8080  r1co/ansible-code-server
```

## Preinstalled vscode plugins
* [gabrielgrinberg.auto-run-command](https://marketplace.visualstudio.com/items?itemName=gabrielgrinberg.auto-run-command)
    * opens default terminal on "startup"
* [chrmarti.ssh](https://marketplace.visualstudio.com/items?itemName=chrmarti.ssh)
    * ssh config helper

## Volumes 
* /etc/ansible - ansible configuration 
* /home/ansible/playbooks - ansible playbooks 
* /home/ansible/.ssh - ansible user ssh config
* /home/ansible/.vscode-data - vscode data (use this if you want to install plugins persistently from the gui)
