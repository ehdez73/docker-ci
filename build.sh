#!/bin/sh
# remove previous images and containers
docker rm -f ci
docker rmi -f ehdez73/docker-ci

# build and run the container
docker build --tag="ehdez73/docker-ci" .
docker run -d \
	-p 8888:8080 \
	-p 9000:9000 \
	-p 9092:9092 \
	--name="ci" ehdez73/docker-ci

# attach to it
#docker exec -i -t ci /bin/bash
