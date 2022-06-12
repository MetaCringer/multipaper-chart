#!/bin/bash
docker build -f build-artifacts.Dockerfile -t multipaper-artifacts .
mkdir -p slave/build master/build
docker run \
--rm \
-v $(pwd)/master/build:/build/master \
-v $(pwd)/slave/build:/build/slave \
--name copy-multipaper-artifacts \
multipaper-artifacts
docker image rm multipaper-artifacts