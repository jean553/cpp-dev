# memoris-dev

C++14 development container. Provision handled by Ansible.

## Properties

* Ubuntu 17.04 (Zesty)
* g++ 4.9 (for C++14 support)
* cmake 3.7.2
* ZSH prompt (including oh-my-zsh)
* VIM profile optimized for C++11/14 edition
* syntastic C++11/14 checker
* doxygen

## Create the container

```
docker run --name cpp-dev -t -i -v {PATH_TO_THE_PROJECT}:/{PROJECT_NAME} jean553/cpp-dev /bin/zsh
```

The container will be started.

## Start the container

```
docker start cpp-dev
```

## Connect to the container

```
docker exec -it cpp-dev /bin/zsh
```
