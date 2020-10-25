#Containerize the server of Minecraft game.
#Link of JAR file: https://www.minecraft.net/en-us/download/server

FROM debian

MAINTAINER trahman <trahman.hive@gmail.com>

RUN apt-get update && apt-get upgrade -y && apt-get install -y wget default-jre

WORKDIR minecraft

RUN wget https://launcher.mojang.com/mc/game/1.13/server/d0caafb8438ebd206f99930cfaecfa6c9a13dca0/server.jar

RUN echo 'eula=true' > eula.txt

EXPOSE 25565

ENTRYPOINT java -Xmx1024M -Xms1024M -jar server.jar

# How to build it?
# docker build -t ex04 .

# How to run it?
# docker run --rm -d -p 25565:25565 ex04
