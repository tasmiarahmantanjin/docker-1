#!/bin/sh

RED='\033[0;31m'
GREEN='\033[0;32m'

printf "${RED}TEST FOR EX02 OF DOCKERFILE\n";
printf "${GREEN}Go inside of the ft_rails folder\n";
cd ft-rails/

printf "${RED}clone the ruby app\n";
git clone https://github.com/RailsApps/rails-signup-thankyou.git app

printf "${GREEN}build the ft-rails:on-build... inside of ft_rails folder\n";
docker build -t ft-rails:on-build .

printf "${RED}Go back to root directory\n";
cd ..

printf "${GREEN}Build the image\n";
docker build -t ex02 .

printf "${RED}Build completed. Now it's Running with the ID...\n";
printf "${RED}Congratulations!!! go check: 192.168.99.100:3000\n";
docker run -it --rm -p 3000:3000 ex02