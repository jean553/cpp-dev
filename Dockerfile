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

RUN mkdir /var/run/sshd

RUN useradd \
        --shell /bin/bash \
        --create-home --base-dir /home \
        --user-group \
        --groups ssh \
        --password '' \
        vagrant && \
    mkdir -p /home/vagrant/.ssh && \
    chown -R vagrant:vagrant /home/vagrant/.ssh

RUN chmod +w ${SUDOFILE} && \
    echo 'vagrant        ALL=(ALL)      ALL' >> ${SUDOFILE}

RUN echo 'vagrant:vagrant' | chpasswd

COPY provisioning/ provisioning

RUN ansible-playbook provisioning/site.yml -c local

RUN chsh -s /bin/zsh vagrant

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
