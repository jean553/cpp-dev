# vim:set ft=dockerfile
FROM ubuntu:artful

ENV SUDOFILE /etc/sudoers

# install ansible
RUN apt-get update -y
RUN apt-get install -y \
    python-dev \
    python-pip \
    libssl-dev \
    libffi-dev \
    sudo \
    openssh-server

RUN pip install --upgrade \
    appdirs \
    packaging \
    ansible

COPY provisioning/ provisioning
RUN ansible-playbook provisioning/site.yml -c local

RUN chsh -s /bin/zsh vagrant

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
