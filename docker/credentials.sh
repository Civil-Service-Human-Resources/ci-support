#!/bin/bash -ex

cat > ~/.dockercfg <<EOF
{
    "https://index.docker.io/v1/": {
        "auth": "${DOCKER_HUB_AUTH}",
        "email": "${DOCKER_HUB_EMAIL}"
    }
}
EOF
