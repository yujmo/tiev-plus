#!/bin/bash
docker run --gpus all --init --rm -u 1200 --name tiev-plus-docker --privileged \
-e "DISPLAY" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
-v $(pwd):/home/docker/tiev-plus -ti registry.gitlab.com/tjiv/tiev-plus:$(git rev-parse --verify HEAD) bash
