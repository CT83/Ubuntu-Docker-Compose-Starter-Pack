# Ubuntu-Docker-Compose-Starter-Pack

Recently, I was trying to spin up a simple Ubuntu container. I noticed that a simple guide with some basic boilerplate code was too difficult to find. So, I wrote my own. 

View it on Github - [Ubuntu-Docker-Compose-Starter-Pack](https://github.com/CT83/Ubuntu-Docker-Compose-Starter-Pack)

### 🐳 

Note, this assumes that you have a gentle grasp of what Docker Compose and Containerization are, so stay put for the rodeo!

#### Components

1. Dockerfile
2. Docker Compose Configuration
3. Startup script

#### 1. Dockerfile

Consider this a recipe that tells Docker how the image needs to be assembled.

Read More - [Here](https://docs.docker.com/engine/reference/builder/)

```
FROM ubuntu:latest

COPY . ./start_script.sh
RUN ["chmod", "+x", "start_script.sh"]

ENTRYPOINT ["sh","./start_script.sh"]
```

Here, we pull the latest ubuntu image from Docker Hub and copy over the startup script (and make it executable) which will be run when the container is initialized, more on this later. 

#### 2. Docker Compose Configuration

A Docker Compose Configuration file or .yml file tells docker how many and what containers we are trying to spin up, what volumes need to be mounted and what environment variables need to be defined. 

Read More - [Here](https://docs.docker.com/compose/compose-file/)

```
version: "3.3"

services:
  hello_container:
    container_name: hello_contaier
    build: .

    volumes:
      - ./data:/mnt/data
      - ./data2:/mnt/data2

    environment:
      SYS_NAME: good-container

volumes: 
  data :
  data2 :
```

Here, we are declaring the container which we plan to use, it's name, volumes which we plan to mount and environment variables we want to use. 

#### 3. Startup Script

This is the file that will be run when the container is created, all the commands your servers, startup scripts should go in here. 

```
#!/bin/bash

echo "Hello World! This is the Ubuntu Container!"
```

### That's it!

#### Spinning up the containers

Once you have docker and docker-compose installed you can simply do

`docker-compose up --build`

to start everything!

View it on Github - [Ubuntu-Docker-Compose-Starter-Pack](https://github.com/CT83/Ubuntu-Docker-Compose-Starter-Pack)
