# docker-1

## Usefull REPO & LINKS
	1. https://github.com/VBrazhnik/docker-1/wiki/How-to-Docker

## Some usefull command
	1. docker-machine ls (to see the docker-machine content)
	2. docker ps -a or docker ps -all(to see the docker image state & details)
	3. docker --name desired_container_name_for the image image_name (doceker --name overlord nginx) : to give a container name to a image

## Debug 
	1. If docker deamon is not connected
      	1. docker-machine regenerate-certs machine_name
      	2. env
      	3. eval $(docker-machine env Char)
      	4. docker version
      	5. It should be good.
	2. 