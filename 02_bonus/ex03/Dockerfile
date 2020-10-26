#Basic website contanarization

FROM httpd:2.4

LABEL maintainer="trahman@student.hive.fi"

COPY ./public-html/ /usr/local/apache2/htdocs/

# How to build it?
# docker build -t ex03 .
#docker build -t my-apache2 .

# How to run it?
# docker run --rm -d -p 8080:80  ex03

#How to test it?
#Visit http://localhost:8080 and you will see It works!

#Link: https://hub.docker.com/_/httpd