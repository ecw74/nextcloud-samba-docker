#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

IMAGE_NAME="ecw74/nextdloud-facrec"
VCS_REF=$(git rev-parse --short HEAD)


BUILDKIT_PROGRESS=plain DOCKER_BUILDKIT=1 docker build --rm \
    --build-arg VCS_REF=$VCS_REF \
    -t $IMAGE_NAME:fpm-alpine .