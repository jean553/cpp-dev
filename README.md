# cpp-dev

C++14 development container. Provision handled by Ansible.
Compile and execute C++14 code into an isolated/ready-to-be-used environment.

## Table of content

 * [Image properties](#image-properties)
 * [Simple usage](#simple-usage)
 * [Vagrant usage](#vagrant-usage)

## Image properties

* Ubuntu 17.10 (Artful)
* g++ 7.2
* cmake 3.9
* ZSH prompt (including oh-my-zsh)
* VIM profile optimized for C++11/14 edition
* syntastic C++11/14 checker
* doxygen

## Simple usage

Create the container:

```sh
docker run --name cpp-dev -t -i -v {PATH_TO_THE_PROJECT}:/{PROJECT_NAME} jean553/cpp-dev /bin/zsh
```

Start the container:

```sh
docker start cpp-dev
```

Use a shell into the container:

```sh
docker exec -it cpp-dev /bin/zsh
```

## Vagrant usage

There is one Vagrantfile example into the project.

```sh
vagrant up
```

```sh
vagrant ssh
```
