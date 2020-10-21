FROM ubuntu:16.04

# Suppported installations:
# https://about.gitlab.com/install/

MAINTAINER trahman <trahman.hive@gmail.com>

ENV TERM=xterm

# Without setting a terminal variable to the shell of your choice we get the 
# following error message: Environment variable: TERM has not been set

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y xterm ca-certificates openssh-server wget postfix

# Now we need to install and configure the necessary dependencies, with postfix
# we can send notification emails.
# https://about.gitlab.com/install/#ubuntu

RUN wget https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh && chmod 777 script.deb.sh && ./script.deb.sh && apt-get install -y gitlab-ce

RUN apt update && apt install -y tzdata && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN sed -i "s/# grafana\['enable'\] = true/grafana['enable'] = false/g" /etc/gitlab/gitlab.rb

# sed->stream editor for filtering and transforming text
# -i -> edit files in place
# Error “ruby_block[authorize Grafana with GitLab] action run”
# Grafana is is used to monitor things happening on GitLab, but it can 
# take an eternity to authorize, and sometimes it down right refuses to initialize properly.
# https://docs.gitlab.com/omnibus/settings/grafana.html

EXPOSE 443 80 22

# We need to expose the needed ports for GitLab
# https://docs.gitlab.com/omnibus/package-information/defaults.html

ENTRYPOINT (/opt/gitlab/embedded/bin/runsvdir-start &) && gitlab-ctl reconfigure && tail -f /dev/null

# We set our entry point to reconfigure our GitLab setup, which will also
# start GitLab after the setup is completed.
# The tail is needed to keep Docker Containers Runnig:
# http://bigdatums.net/2017/11/07/how-to-keep-docker-containers-running/

#NOTES & TIPS:

# If you doesn't add something like tail -f /dev/null as the last command, 
# your GitLab will shut down. You need something to hang on your terminal.
# And the last one tip. If you will see Whoops, GitLab is taking too much time to respond page, 
# just wait and sometimes reload the page. 
# It is absolutely normal. After 5-10 minutes you will get a ready Gitlab.

# COMMAND FOR BUILDING AND RUNNING THE DOCKERFILE:

# docker build -t ex03 . && docker run -it --shm-size=4g --rm -p 8080:80 -p 8022:22 -p 8443:443 --privileged ex03
# We can change the virtual memory size with the --shm-size parameter, when we run the container,
# to speed up the Slow Startup Time:
# https://www.cyberciti.biz/tips/what-is-devshm-and-its-practical-usage.html
# --privileged -> We need rights to write to the docker container file system, with
# privileged we get that result.

# Check the result in your web browser: 
# http://192.168.99.101:8080
# We need to create first a new password, after that we can log in wiht root and
# use GitLabCE.
