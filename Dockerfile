# vim:set ft=dockerfile
FROM ubuntu:artful

ENV SUDOFILE /etc/sudoers

# install ansible
RUN apt-get update -y
RUN apt-get install ansible -y

COPY provisioning/ provisioning
RUN ansible-playbook provisioning/site.yml -c local

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
