#!/bin/bash
CI_COMMIT_SHA=$(git rev-parse --verify HEAD)
docker save registry.gitlab.com/tjiv/tiev-plus:$CI_COMMIT_SHA | gzip > tiev_plus_docker_image_$CI_COMMIT_SHA.tar.gz
