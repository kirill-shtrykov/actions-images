#!/bin/bash

if [ -z "$1" ]; then
echo "You need to pass the registry and the image name as an argument."
exit 1
fi

export DOCKER_BUILDKIT=1
export REGISTRY=$1
export IMAGE_NAME=$2
export TAG=${REGISTRY}/${IMAGE_NAME}:$(date +%Y.%m.%d)
docker build -t ${TAG} . \
&& docker push ${TAG}