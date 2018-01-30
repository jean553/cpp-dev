# cpp-dev

C++14 development container. Provision handled by Ansible.
Compile and execute C++14 code into an isolated/ready-to-be-used environment.

## Properties

* Ubuntu 17.10 (Artful)
* g++ 7.2
* cmake 3.9
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
