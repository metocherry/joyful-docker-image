#!/usr/bin/env bash

docker image build -t centos7/node:latest .
docker image tag centos7/node metocherry/centos7-node:latest
