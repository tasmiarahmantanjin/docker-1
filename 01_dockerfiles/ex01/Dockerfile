# Base system is Debian for TeamSpeak3
FROM debian

MAINTAINER trahman trahman.hive@gmial.com

# accept server license
ENV TS3SERVER_LICENSE=accept

WORKDIR /home/teamspeak

# Download and install everything from the repos.
# Download and install TeamSpeak 3
# Add secondary/backup server as well(tar file) -- allow users to choose in case of blacklisting.

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y wget bzip2 && \
	wget http://dl.4players.de/ts/releases/3.12.1/teamspeak3-server_linux_amd64-3.12.1.tar.bz2 && \
	tar -xvf teamspeak3-server_linux_amd64-3.12.1.tar.bz2

# Expose TeamSpeak3 used ports
# "9987-9999:9987-9999/udp" # voice/virtual server UDP ports
# "10011:10011" # query TCP port
# "30033:30033" # file transfer TCP port
EXPOSE 9987/udp 10011 30033

WORKDIR teamspeak3-server_linux_amd64

ENTRYPOINT sh ts3server_minimal_runscript.sh

# How to build it?

# docker build -t ex01 .

# How to run it?

# docker run --rm -p 9987:9987/udp -p 10011:10011 -p 30033:30033 ex01
# docker run -it --rm -p=9987:9987/udp -p=10011:10011 -p=30033:30033 ex01
# dokcer logs my_teamspeak >>>>> to cchecck the admin pass

# How to TEST it???
# Download teamspeak client from the webstore of school mac
# Enter the "Char machine IP" as a server name
# Enter the token==number as whole ass a passwork
# Enter the token==number as a privilage key
# Congratulation it connected


# Resources: 
# https://docs.docker.com/samples/library/teamspeak/#container-shell-access
# https://www.vultr.com/docs/how-to-install-teamspeak-3-server-on-ubuntu-16-04-64-bit
