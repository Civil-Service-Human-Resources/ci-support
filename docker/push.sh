#!/bin/bash -ex

DOCKER_IMAGE_NAME=$1

if [ -z "${DOCKER_IMAGE_NAME}" ]; then
    DOCKER_IMAGE_NAME=$(echo ${CIRCLE_PROJECT_REPONAME} | tr '[:upper:]' '[:lower:]')
fi

export DOCKER_IMAGE_NAME=${DOCKER_IMAGE_NAME}
export BRANCH_TAG=`echo ${CIRCLE_BRANCH} | sed 's/\//-/g'`
export ORGANISATION=cshr

sudo docker push ${ORGANISATION}/${DOCKER_IMAGE_NAME}:${BRANCH_TAG}

sudo docker tag ${ORGANISATION}/${DOCKER_IMAGE_NAME}:${BRANCH_TAG} ${ORGANISATION}/${DOCKER_IMAGE_NAME}:${CIRCLE_SHA1} || true
sudo docker push ${ORGANISATION}/${DOCKER_IMAGE_NAME}:${CIRCLE_SHA1}
