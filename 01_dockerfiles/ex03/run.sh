#!/bin/sh

# How to build it?
docker build -t ex03 .

# How to run it?
#docker run -it --rm -p 8080:80 -p 8022:22 -p 8443:443 --privileged ex03
docker run -it --shm-size=4g --rm -p 8080:80 -p 8022:22 -p 8443:443 --privileged ex03
# HOW TO TEST IF EVRYTHING IS WIRKING OR NOT

# GO-TO a web browser:
# http://192.168.99.100:8080
# We need to create first a new password, after that we can log in wiht root and use GitLabCE.
# my usename: root
# my password: rootroot
# Then you need to create a repo and then go to that repo and clone it via terminal like:
# git clone root@192.168.99.100:root/test.git (remember to use your ip in clone)(for ssh)
# git clone http://192.168.99.100:8080/root/test.git (for http)
# finally, you are able to push stuff in your repo
# TA-DA you are done!!!
