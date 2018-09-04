#!/bin/sh

########################################################
#                                                      #
#  for server that does not support multi-stage build  #
# https://blog.alexellis.io/mutli-stage-docker-builds/ #
#                                                      #
########################################################

echo Building node:build

docker build --build-arg REACT_APP_USERS_SERVICE_URL=http://localhost --build-arg NODE_ENV=production \
		-t node:nbuild . -f Dockerfile.build

docker container create --name extract node:nbuild
docker container cp extract:/usr/src/app ./app
docker container rm -f extract

echo Building nginx

docker build --no-cache .
rm -r ./app
docker rmi -f node:nbuild
