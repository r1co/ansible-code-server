FROM codercom/code-server:latest

USER root

# install ansible
RUN apt update && apt install -y  software-properties-common openssh-client ca-certificates
RUN apt-add-repository --yes --update ppa:ansible/ansible
RUN apt update && apt install -y \
        ansible \
        curl \
        wget \
        nano \
        dnsutils \
        cron \
        supervisor \
    && rm -rf /var/lib/apt/lists/*

# setup entrypoint
ADD run.sh /usr/bin/run
RUN chmod +x /usr/bin/run

# add user
RUN useradd -ms /bin/bash ansible
WORKDIR /home/ansible

# setup user home
RUN mkdir -p .vscode-data .ssh playbooks global-roles
ADD ansible-workspace.code-workspace /home/ansible/playbooks/ansible.code-workspace
RUN chown -R ansible:ansible /home/ansible /etc/ansible/

# setup supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf


# set user
WORKDIR /home/ansible/playbooks/

# volumes
VOLUME ["/home/ansible/playbooks", "/etc/ansible", "/home/ansible/.ssh", "/home/ansible/.vscode-data"]

ENTRYPOINT /usr/bin/run
