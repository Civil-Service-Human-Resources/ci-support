#!/bin/bash -ex

DIR=$1
DOCKER_IMAGE_NAME=$2

if [ -z "${DIR}" ]; then
    DIR="."
    DOCKER_IMAGE_NAME=$(echo ${CIRCLE_PROJECT_REPONAME} | tr '[:upper:]' '[:lower:]')
fi

export DIR=${DIR}
export DOCKER_IMAGE_NAME=${DOCKER_IMAGE_NAME}
export BRANCH_TAG=`echo ${CIRCLE_BRANCH} | sed 's/\//-/g'`
export ORGANISATION=cshr

cd ${DIR} && sudo docker build -t ${ORGANISATION}/${DOCKER_IMAGE_NAME}:${BRANCH_TAG} .
