#!/usr/bin/env bash

docker run \
  -it \
  --rm \
  --name nodejs \
  -v "$(pwd)"/:/app:cached \
  metocherry/centos7-base:latest \
  /bin/bash
