#!/usr/bin/env bash

docker run \
  -it \
  --rm \
  --name centos8-node \
  -v "$(pwd)"/:/app:cached \
  centos:latest \
  /bin/bash
