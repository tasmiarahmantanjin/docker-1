#Building a NodeJS environment

FROM ubuntu

LABEL trahman="trahman@student.hive.fi"

#ENV UBUNTU_FRONTEND=noninteractive 
#ENV TZ=Europe/Helsinki

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y tzdata && \
	apt-get install -y nodejs npm git build-essential vim
RUN npm install npm --global
RUN npm install yarn --global

# How to build it?
# docker build -t ex02 .

# How to run it?
# docker run --rm -ti ex02

# How to test it?
# node -v && npm -v && yarn add node && npm install node