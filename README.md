# Docker Continuous Integration

This image contains a Jenkins and a Sonar installation

* Jenkins 1.632 with plugins:
   * git
   * git-client
   * scm-api
   * build-pipeline-plugin
   * parameterized-trigger
   * jquery
   * conditional-buildstep
   * run-condition
   * token-macro
   * copyartifact
   * promoted-builds
   * sonar
   
* Sonar 5.1.2
   * sonar-javascript-plugin
   * sonar-build-breaker-plugin

* Java 1.8
* Node
* Gulp
* Grunt
* Bower
* PhantomJS 



# Some useful commands:

    # Build the image
    $ docker build --tag="ehdez73/docker-ci" .
    
    # Run a container 
    $ docker docker run -d \
          -p 8888:8080 \
          -p 9000:9000 \
          -p 9092:9092 \
          --name="ci" \
          ehdez73/docker-ci

    # Attach to the container
    $ docker exec -i -t ci /bin/bash
    
    # Stop the container
    $ docker stop ci
    
    # Re-start the container
    $ docker start ci
    
    # remove the container
    $ docker rm ci
    
    # remove the image
    $ docker rmi ehdez73/docker-ci


## Usage
* Browse to Jenkins : [http://localhost:8888](http://localhost:8888)
* Browse to Sonar : [http://localhost:9000](http://localhost:9000)
* Sonar DB : jdbc:h2:tcp://localhost:9092/sonar 


