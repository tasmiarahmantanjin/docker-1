# DOCKER-1

[42 Project] - Last project of the 42 school's DevOps branch

## ***Project description***

[42 Project] - Last project of the 42 school's DevOps branch. The aim of the Docker-1 project is to make you handle docker and docker-machine and dockerfile, the bases to understand the idea of containerization of services. This project will allow you to deploy different apps, server & websites with dockerfile.

Docker-1 project mainly consists of 3 different parts:
1. 00_how_to_docker
2. 01_dockerfile
3. 02_bonus

You can get the subject in the root folder. Inside of the directory you can find the answers and expalnation about every exercise.

### ***How to install docker in school MAC***

For the docker-1 project we are not allowed to use the MAC desktop environment insteed we need to use homebrew. below you can find the installation instruction step by step.

1. First of all we need to install Homebrew on school's Mac:
```
rm -rf $HOME/.brew && git clone --depth=1 https://github.com/Homebrew/brew $HOME/.brew && export PATH=$HOME/.brew/bin:$PATH && brew update && echo "export PATH=$HOME/.brew/bin:$PATH" >> ~/.zshrc
```
2. Install the docker & docker-machine using homebrew
```
brew install docker docker-machine
```
3. Now we need to move  .Docker folder to goinfre folder because the space limitation:
```
mv .docker/ /goinfre/trahman
```
4. Finally, creating a soft link to home directory:
```
ln -s /goinfre/dmukaliy/.docker $HOME
```
5. Now we are ready to start the project!!!

### ***Debug (if docker daemon is not running)***

	1. If docker deamon is not connected
	1. docker-machine regenerate-certs Char
	2. eval $(docker-machine env Char)
	3. docker version
	4. It should be good.