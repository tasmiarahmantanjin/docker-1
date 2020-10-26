# -----------------------------------------------------------------------------
# docker-minecraft
#
# Builds a basic docker image that can run a Minecraft server
# (http://minecraft.net/).
# -----------------------------------------------------------------------------

FROM debian:stretch

# Stretch, so not all versions of Debian images are downloaded.

LABEL maintainer="trahman@student.hive.fi"

ENV MINECRAFT_UTILITY https://github.com/marblenix/minecraft_downloader/releases/download/latest/minecraft_downloader_linux

# Version of minecraft to download

ENV MINECRAFT_VERSION latest

RUN apt update; \
    apt install -y default-jre ca-certificates-java curl; \
    curl -sL "${MINECRAFT_UTILITY}" -o minecraft_downloader; \
    chmod +x ./minecraft_downloader; \
    ./minecraft_downloader -o minecraft_server_${MINECRAFT_VERSION}.jar;

WORKDIR /data
VOLUME /data

# Sets working directory for the CMD instruction (also works for RUN, ENTRYPOINT commands)
# Create mount point, and mark it as holding externally mounted volume

EXPOSE 25565

# Expose the container's network port: 25565 during runtime.

CMD echo eula=true > /data/eula.txt && java -jar /minecraft_server_${MINECRAFT_VERSION}.jar
# Automatically accept Minecraft EULA, and start Minecraft server

# How to build it?
# docker build -t ex04 .

# How to run it?
# docker run --rm -d -p 25565:25565 ex04
