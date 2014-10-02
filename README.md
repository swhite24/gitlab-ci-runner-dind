# gitlab-ci-runner-dind

Exposes [gitlab-ci-runner](https://github.com/gitlabhq/gitlab-ci-runner) within a docker-capable docker container, courtesy [jpetazzo/dind](https://github.com/jpetazzo/dind).  Due to current issues with disk space usage in running the docker daemon within a docker container, I recommend to bind mount the unix socket from the host machine into the container.

## Base Image
[ubuntu:14.04](https://registry.hub.docker.com/_/ubuntu/)

## Installation

1. Install [docker](http://docker.com)
1. Pull automated build via `docker pull swhite24/gitlab-ci-runner-dind`  
  Alternatively, build via  
  `docker build -t my_tag github.com/swhite24/gitlab-ci-runner-dind`

## Usage

To start the runner, either run `setup_and_run`, or run `setup` then `run` in a shell.  
`docker run --privileged -i -t -v /var/run/docker.sock:/var/run/docker.sock swhite24/gitlab-ci-runner-dind`
