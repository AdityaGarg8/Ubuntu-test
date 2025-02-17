#!/bin/bash

set -eu -o pipefail

DOCKER_IMAGE=ubuntu:24.04

echo "DOCKER_IMAGE=${DOCKER_IMAGE}"
docker pull ${DOCKER_IMAGE}

docker run \
  --privileged \
  --rm \
  -t \
  -v "$(pwd)":/repo \
  ${DOCKER_IMAGE} \
  /bin/bash -c "cd /repo && ./build.sh $1"

