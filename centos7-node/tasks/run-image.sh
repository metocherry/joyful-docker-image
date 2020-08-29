#!/usr/bin/env bash

docker run \
  -it \
  --rm \
  --name base \
  -v "$(pwd)"/:/app:cached \
  centos7/node:latest \
  /bin/bash
