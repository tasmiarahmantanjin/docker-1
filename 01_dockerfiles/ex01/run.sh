#!/bin/sh

echo "Building your image..."
docker build -t ex01 .
# Run in the background & publish to the port
echo "Build completed. Now it's Running with this ID..."
docker run -it -d --name my_teamspeak --rm -p 9987:9987/udp -p 10011:10011 -p 30033:30033 ex01
echo "Server is running."

# Connect with local client to $(docker-machine ip Char)."
# echo "When finished, run \`docker stop my_teamspeak\`"

# HOW TO TEST IT?
# After runnig the run.sh, server will run in the background
# go to web-browser and type:>>> ts3server://192.168.99.100:10011 (YOUR MACHINE IP)
# docker logs my_teamspeak :>>> TO CHECK TTHE TOKERN NUMBER
# GO TO TS3 CLIENT AND USER CHAR IP AS A SERVER NAME AND TOKEN ID AS PASS
