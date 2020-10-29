FROM ubuntu:16.04

LABEL trahman="trahman@student.hive.fi"

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

# How to build it?
#docker build -t ex03 .

# How to run it?
#docker run -it --rm -p 8080:80 -p 8022:22 -p 8443:443 --privileged ex03

# How to Test it?

#1. Check the result in your web browser:
#2. http://192.168.99.100:8080 (VM IP, it can be different in everytime you start the VM)
#3. We need to create first a new password, after that we can log in wiht root and
#4. use GitLabCE.
#5. my password: rootroot
#6. my usename: root
#7. then you need to create a repo and then go to that repo and clone it via terminal like:
#8. git clone http://192.168.99.100/root/test-repo.git (remember to use your ip in clone)
#9. finally, you are able to push stuff in your repo

# Explanation about Dockerfile

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

#1. Before build make change to VM setting: increase CPU count 1 to 2 && memory 5500 (Manually)
#2. or We can change the virtual memory size with the --shm-size parameter, when we run the container-
#3. to speed up the Slow Startup Time.
#4. https://www.cyberciti.biz/tips/what-is-devshm-and-its-practical-usage.html
#5. --privileged (flag) We need rights to write to the docker container file system, with privileged we get that result.