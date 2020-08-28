#!/usr/bin/env bash

docker run \
  --privileged \
  -it \
  --rm \
  --name centos8-node \
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
  -v "$(pwd)"/:/app:cached \
  centos:latest \
  /bin/bash


docker run -d \
  --privileged \
  --name centos7-base \
  centos:centos7 \
  /sbin/init

docker exec -it centos7-base /bin/bash

