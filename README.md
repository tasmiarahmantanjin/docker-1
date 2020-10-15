# DOCKER-1

## Usefull REPO & LINKS

	1. https://github.com/VBrazhnik/docker-1/wiki/How-to-Docker

## Some usefull command

	1. docker-machine ls (to see the docker-machine content)
	2. docker ps -a or docker ps -all(to see the docker image state & details)
	3. docker --name desired_container_name_for the image image_name (doceker --name overlord nginx) : to give a container name to a image
	4. docker node ls (to check which machine is LEADER)


## To set-up the docker-machine && containers(TO UP)

	1. docker-machine start Char
	2. docker-mchine start Aiur
	3. eval $(docker-machine env Char)
	4. docker restart overlord
	5. docker restart lair
	6. docker restart roach-warden
	7. docker restart Abathur
	8. docker exec -e FLASK_APP=/root/app.py Abathur flask run --host=0.0.0.0 --port 3000

## DEBUG

	1. If docker deamon is not connected
      	1. docker-machine regenerate-certs Char
      	2. eval $(docker-machine env Char)
      	3. docker version
      	4. It should be good.

## Additional INFO

	1. mysql/php:>>> User: root, Pass: Kerrigan
	2. WORDPRESS:>>> User: root, Pass: root
	3. docker exec -e FLASK_APP=/root/app.py Abathur flask run --host=0.0.0.0 --port 3000 :->>> To up and run my python app
	4. RABBITMQ>>> User: root, Pass: root
	5. 42school/engineering-bay>>> OC_USERNAME=root, OC_PASSWD=root