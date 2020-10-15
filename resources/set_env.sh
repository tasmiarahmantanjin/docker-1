#!/bin/sh
#If the environment is not set-up at the beginning

docker-machine start Char
docker-mchine start Aiur
#docker-machine regenerate-certs Char
eval $(docker-machine env Char)

#docker restart overlord
#docker restart lair
#docker restart roach-warden
#docker restart Abathur
#docker exec -e FLASK_APP=/root/app.py Abathur flask run --host=0.0.0.0 --port 3000