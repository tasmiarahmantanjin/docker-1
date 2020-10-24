# Talking Cow with the image cawsay

FROM debian

MAINTAINER trahman <trahman.hive@gmail.com>

RUN apt-get update && apt-get install -y cowsay fortune lolcat

ENTRYPOINT /usr/games/fortune | /usr/games/cowsay | /usr/games/lolcat

# How to build it?
# docker build -t ex00 .

# How to run it?
# docker run --rm -t ex00

#Explanation

#fortune: fortune is a program that displays a pseudorandom message from a database of quotations that first appeared in Version 7 Unix.
#cowsay: cowsay is a program that generates ASCII pictures of a cow with a message.
#lolcat produces rainbow of colors in terminal.
#Flag -t is important in docker run --rm -t a00 command. Without this flag cow will get no color.