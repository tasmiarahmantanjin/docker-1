# DOCKER-1



## Usefull REPO & LINKS for this project

	1. https://github.com/VBrazhnik/docker-1/wiki/How-to-Docker

## Some usefull docker command

	1. docker-machine ls (to see the docker-machine content)
	2. docker ps -a or docker ps -all(to see the docker image state & details)
	3. docker --name desired_container_name_for the image image_name (doceker --name overlord nginx) : to give a container name to a image
	4. docker node ls (to check which machine is LEADER)

## 01_how_to_docker

## To set-up the docker-machine && containers(TO UP)

	1. docker-machine start Char
	2. docker-mchine start Aiur
	3. eval $(docker-machine env Char)
	4. docker restart overlord
	5. docker restart lair
	6. docker restart roach-warden
	7. docker restart Abathur
	8. docker exec -e FLASK_APP=/root/app.py Abathur flask run --host=0.0.0.0 --port 3000

## DEBUG

	1. If docker deamon is not connected
      	1. docker-machine regenerate-certs Char
      	2. eval $(docker-machine env Char)
      	3. docker version
      	4. It should be good.

## Additional INFO

	1. mysql/php:->>> User: root, Pass: Kerrigan
	2. WORDPRESS:->>> User: root, Pass: root
	3. docker exec -e FLASK_APP=/root/app.py Abathur flask run --host=0.0.0.0 --port 3000 :->>> To up and run my python app
	4. RABBITMQ :->>> User: root, Pass: root
	5. 42school/engineering-bay :->>> OC_USERNAME=root, OC_PASSWD=root


# 01_dockerfile

## 💡 ***EX_00***

### ⚡️ ***ANSWER***
```
FROM alpine:latest

MAINTAINER trahman <trahman@gmail.com>

RUN apk add --no-cache vim -f

CMD ["vim"]
```

### ⚡️ ***COMMAND FOR BUILDING AND RUN THE DOCKERFILE***
```
1. docker build -t ex00 .
2. docker run --rm -ti ex00
```

### ⚡️ ***EXPLANATION***

## 💡 ***EX_01***

### ⚡️ ***ANSWER***
```
FROM debian

MAINTAINER trahman <trahman.hive@gmail.com>

ENV TS3SERVER_LICENSE=accept

WORKDIR /home/teamspeak

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y wget bzip2 && \
	wget http://dl.4players.de/ts/releases/3.12.1/teamspeak3-server_linux_amd64-3.12.1.tar.bz2 && \
	tar -xvf teamspeak3-server_linux_amd64-3.12.1.tar.bz2

EXPOSE 9987/udp 10011 30033

WORKDIR teamspeak3-server_linux_amd64

ENTRYPOINT sh ts3server_minimal_runscript.sh
```
### ⚡️ ***COMMAND FOR BUILDING AND RUN THE DOCKERFILE***
```
1. docker build -t ex01 .
2. docker run -it -d --name my_teamspeak --rm -p 9987:9987/udp -p 10011:10011 -p 30033:30033 ex01
```
### ⚡️ ***EXPLANATION***


## 💡 ***EX_02***

### ⚡️ ***ANSWER***
```
FROM ruby:2.5.1

MAINTAINER trahman <trahman@gmail.com>

RUN apt-get update && apt-get install -y nodejs
RUN gem install rails --version 5.2.0

RUN mkdir -p /opt/app
COPY app /opt/app

ONBUILD WORKDIR /opt/app
ONBUILD RUN bundle install
ONBUILD RUN rake db:create
ONBUILD RUN rake db:migrate
ONBUILD RUN rake db:seed
```

### ⚡️ ***Scripts FOR BUILDING AND RUN THE DOCKERFILE***
```
#!/bin/sh

RED='\033[0;31m'
GREEN='\033[0;32m'

printf "${RED}TEST FOR EX02 OF DOCKERFILE\n";
printf "${GREEN}Go inside of the ft_rails folder\n";
cd ft-rails/

printf "${RED}clone the ruby app\n";
git clone https://github.com/RailsApps/rails-signup-thankyou.git app

printf "${GREEN}build the ft-rails:on-build... inside of ft_rails folder\n";
docker build -t ft-rails:on-build .

printf "${RED}Go back to root directory\n";
cd ..

printf "${GREEN}Build the image\n";
docker build -t ex02 .

printf "${RED}Build completed. Now it's Running with the ID...\n";
printf "${RED}Congratulations!!! go check: 192.168.99.100:3000\n";
docker run -it --rm -p 3000:3000 ex02
```
### ⚡️ ***EXPLANATION***


## 💡 ***EX_03***

### ⚡️ ***ANSWER***
```
FROM ubuntu:16.04

MAINTAINER trahman <trahman.hive@gmail.com>

ENV TERM=xterm

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y xterm ca-certificates openssh-server wget postfix

RUN wget https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh && chmod 777 script.deb.sh && ./script.deb.sh && apt-get install -y gitlab-ce

RUN apt update && apt install -y tzdata && \
	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN sed -i "s/# grafana\['enable'\] = true/grafana['enable'] = false/g" /etc/gitlab/gitlab.rb

EXPOSE 443 80 22

ENTRYPOINT (/opt/gitlab/embedded/bin/runsvdir-start &) && gitlab-ctl reconfigure && tail -f /dev/null
```
### ⚡️ ***Script FOR BUILDING AND RUN THE DOCKERFILE***
```
#!/bin/sh

# How to build it?
docker build -t ex03 .

# How to run it?
docker run -it --rm -p 8080:80 -p 8022:22 -p 8443:443 --privileged ex03
```

### ⚡️ ***HOW TO TEST IF THE EVERYTHING IS RIGHT OR NOT?***
```
1. Check the result in your web browser:
2. http://192.168.99.100:8080 (VM IP, it can be different in everytime you start the VM)
3. We need to create first a new password, after that we can log in wiht root and
4. use GitLabCE.
5. my password: rootroot
6. my usename: root
7. then you need to create a repo and then go to that repo and clone it via terminal like:
8. git clone http://192.168.99.100/root/test-repo.git (remember to use your ip in clone)
9. finally, you are able to push stuff in your repo
```

### ⚡️ ***EXPLANATION OF THE ANSWER***

```
# https://about.gitlab.com/install/

# Without setting a terminal variable to the shell of your choice we get the 
# following error message: Environment variable: TERM has not been set

# Now we need to install and configure the necessary dependencies, with postfix
# we can send notification emails. (https://about.gitlab.com/install/#ubuntu)

# sed->stream editor for filtering and transforming text
# -i -> edit files in place
# Error “ruby_block[authorize Grafana with GitLab] action run”
# Grafana is is used to monitor things happening on GitLab, but it can 
# take an eternity to authorize, and sometimes it down right refuses to initialize properly.
# https://docs.gitlab.com/omnibus/settings/grafana.html

# We need to expose the needed ports for GitLab (https://docs.gitlab.com/omnibus/package-information/defaults.html)

# We set our entry point to reconfigure our GitLab setup, which will also
# start GitLab after the setup is completed.
# The tail is needed to keep Docker Containers Runnig:
# http://bigdatums.net/2017/11/07/how-to-keep-docker-containers-running/

# Explanation about the flag used for BUILD & RUN the container

1. Before build make change to VM setting: increase CPU count 1  to 2 && memory 2048 (Manually)
2. or We can change the virtual memory size with the --shm-size parameter, when we run the container-
3. to speed up the Slow Startup Time.
4. https://www.cyberciti.biz/tips/what-is-devshm-and-its-practical-usage.html
5. --privileged (flag) We need rights to write to the docker container file system, with privileged we get that result.
```

### ⚡️ ***NOTES & TIPS:***
```
# If you doesn't add something like tail -f /dev/null as the last command, your GitLab will shut down. You need something to hang on your terminal.
# And the last one tip. If you will see Whoops, GitLab is taking too much time to respond page, just wait and sometimes reload the page. 
# It is absolutely normal. After 5-10 minutes you will get a ready Gitlab.
```