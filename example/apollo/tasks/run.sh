#!/usr/bin/env bash

docker run \
  --rm \
  -it \
  --name app-apollo \
  -p 3000:3000 \
  -v "$(pwd)"/:/app:cached \
  metocherry/centos8-node \
  /bin/bash
