#!/usr/bin/env bash

docker run \
  -it \
  --rm \
  --name nodejs \
  -v "$(pwd)"/:/app:cached \
  centos8/node:latest \
  /bin/bash
