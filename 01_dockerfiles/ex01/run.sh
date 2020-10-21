#!/bin/sh
echo "Building your image..."
docker build -t ex01 .
# Run in the background & publish to the port
echo "Build completed. Now it's Running with this ID..."
docker run -it --name my_teamspeak --rm -p 9987:9987/udp -p 10011:10011 -p 30033:30033 ex01
echo "Server is running."
# Connect with local client to $(docker-machine ip Char)."
#echo "When finished, run \`docker stop my_teamspeak\`"