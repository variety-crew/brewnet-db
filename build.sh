#!/bin/bash

# check if .env file exist
if [ ! -f .env ]; then
  echo ".env not exist"
  exit 1
fi

# load .env file
export $(cat .env | xargs)

# build docker image
docker build \
  --build-arg MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD \
  --build-arg MYSQL_DATABASE=$MYSQL_DATABASE \
  --build-arg MYSQL_USER=$MYSQL_USER \
  --build-arg MYSQL_PASSWORD=$MYSQL_PASSWORD \
  -t $DOCKER_USERNAME/$DOCKER_REPOSITORY_NAME . --platform linux/x86_64
