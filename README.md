# Scripts to support continuous integration

* [CircleCI](https://circleci.com/)
* [Getting started](https://circleci.com/docs/getting-started) 
* [Environment variables](https://circleci.com/docs/environment-variables)

## Docker

* [Docker](http://www.docker.com/)

### Example `circle.yml`

```yml
machine:
    services:
        - docker

checkout:
    post:
        - git clone git@github.com:Civil-Service-Human-Resources/ci-support.git

deployment:
    docker:
        branch: [develop, master]
        commands:
            # Set up the registry credentials
            - ci-support/docker/credentials.sh
            # Download the existing images to use the cache as much as possible
            - ci-support/docker/pull.sh
            # Build the new docker image
            - ci-support/docker/build.sh
            # Push new docker image
            - ci-support/docker/push.sh
```
