# Exercise 00: vim/emacs
# From an alpine image you’ll add to your container your favorite text editor, 
# vim or emacs, that will launch along with your container

FROM alpine:latest

LABEL trahman="trahman@student.hive.fi"

RUN apk add --no-cache vim -f

CMD ["vim"]

# How to build it?
# docker build -t ex00 .

# How to run it?
# docker run --rm -ti ex00