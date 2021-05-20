# All the Useful Docker Command RUN COMMANDS
  1. docker run -it(open integrated terminal of docker container) -d(run on background) -rm(remove container once it exited)
      ubuntu bash -c "sleep 3; echo all done"(Run the container and run the comands inside container)
  2. docker run -it -rm -p 4678:45678 45679:45679 --name echo-server ubuntu:bash

# BASIC COMMANDS FOR DOCKER WORKFLOW:
  1. Docker ps -a : check the containers
  2. docker images : check all the images
  3. docker run <image-id> <give container a name> -p port:port
  4. docker commit <container-id> <image-name i want to give> :to create a image from a container
  5. docker attach <container-name>   :If a docker container is running on detach name & you want to run that container
  6. docker exec -it <CONTAINER_NAME> bash    :if i want to trigger onemore terminal in a running container
  7. docker port echo :to see what outside port is runnung on relation with internal port
  
 ### NETWORKING COMMAND
  1. docker network ls
  
 ### VOLUME COMMAND
  1. docker run -ti -v path_of_host_machine:/path_of_container_data_folder <image_name> bash
      ex: docker run -it -v /Users/tasmiarahmantanjin/volume_docker_folder:/shared_data_volume ububtu bash
  2. ls shared_data_volume
  3. touch my_data
  2. ls shared_data_volume ✔️
  4. ls /Users/tasmiarahmantanjin/volume_docker_folde : will show me the my_data file
 
### HOW TO SHRARE DATA FROM ONE CONTAINER TO ANOTHER
      1. let's say we have a container named Test1 & Test1
      2. docker run -it -v /shared_data ubuntu bash :caontainer name in Test1: Command will creare a folder name shared:data
      3. docker run -it --volume-from Test1 ubuntu bash : this command will take shared_data folder from Test1 container
      