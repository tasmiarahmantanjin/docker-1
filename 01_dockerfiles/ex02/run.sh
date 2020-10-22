#!/bin/sh

echo "go inside of the ft_rails folder"
cd ft-rails/

echo "clone the ruby app"
#git clone https://github.com/RailsApps/rails-signup-thankyou.git app

echo "build the ft-rails:on-build... inside of ft_rails folder"
docker build -t ft-rails:on-build .

echo "Go back to root directory"
cd ..

# After you build the ft-rails:on-build run this commands
echo "Build your image"
docker build -t ex02 .

echo "Build completed. Now it's Running with this ID..."
docker run -it --rm -p 3000:3000 ex02

echo "Go check the app from browser: 192.168.99.100:3000"
