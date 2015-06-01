# Docker Continuous Integration


## Build
Set up a Docker container with Jenkins & Sonar.


To build the image run **build.sh** and this will:

1. Build the image 
2. Run a container

![Docker](http://blog.docker.com/wp-content/uploads/2013/08/KuDr42X_ITXghJhSInDZekNEF0jLt3NeVxtRye3tqco.png "Docker" )

 Some useful commands: 
```
# Build the image
$ docker build --tag="ehdez73/docker-ci" .

# Run a container 
$ docker docker run -d -p 8888:8080 -p 9000:9000 -p 9092:9092 --name="ci" ehdez73/docker-ci

# Attach to the container
$ docker exec -i -t ci /bin/bash


# Stop the container
$ docker stop ci

# Re-start the container
$ docker start ci

# remove the container
$ docker rm ci

# remove the image
$ docker rmi medianet/ci


## Usage

![Jenkins](https://wiki.jenkins-ci.org/download/attachments/2916393/logo-title.png "Jenkins")
    Browse to Jenkins : http://localhost:8888

![SonarQube](http://www.medianetsoftware.com/wp-content/uploads/2014/06/SonarQube1-780x187.png)
    Browse to Sonar : http://localhost:9000
    Sonar DB : jdbc:h2:tcp://localhost:9092/sonar 


