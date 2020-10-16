#!/bin/sh
echo "Building your image..."
docker build -t ex00 .

echo "Build completed. Now it's time to RUN..."
docker run --rm -ti ex00
echo "Finished"