# gitlab-ci-runner-dind

Exposes [gitlab-ci-runner](https://github.com/gitlabhq/gitlab-ci-runner) within a docker-capable docker container, courtesy [jpetazzo/dind](https://github.com/jpetazzo/dind).  Setup with no images in container, ready to be customized.

## Base Image
[jpetazzo/dind](https://github.com/jpetazzo/dind)

## Installation

1. Install [docker](http://docker.com)
1. Pull automated build via `docker pull swhite24/gitlab-ci-runner-dind`  
  Alternatively, build via  
  `docker build -t my_tag github.com/swhite24/gitlab-ci-runner-dind`

## Usage

To start the runner, choose one of `setup_and_run`, `setup`, and `run`.  
`docker run --privileged -i -t -e LOG=file swhite24/gitlab-ci-runner-dind /gitlab-ci-runner/bin/setup_and_run`