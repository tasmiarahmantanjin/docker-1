FROM ubuntu

MAINTAINER trahman.hive@gmail.com

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y nodejs npm git build-essential vim
RUN RUN npm install yarn --global && npm install npm --global

# How to build it?
# docker build -t ex02 .

# How to run it?
# docker run --rm -ti ex02