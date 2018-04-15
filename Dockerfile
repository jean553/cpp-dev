# vim:set ft=dockerfile
FROM ubuntu:artful

# install ansible
RUN apt-get update -y && \
    apt-get install ansible -y

# build the image using the ansible steps
COPY provisioning/ provisioning
RUN ansible-playbook provisioning/site.yml -c local

# the container listens on port 22 (ssh) at runtime,
# as it should be accessed through `vagrant ssh` for dev
EXPOSE 22

# the main process running on the container is SSH,
# so the dev user can connect to it for dev purposes;
# -D ensures SSH is not run the in the background,
# so it ensures the container stays alive
CMD ["/usr/sbin/sshd", "-D"]
