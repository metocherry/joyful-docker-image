#!/usr/bin/env bash

docker image build -t centos7/base:latest .
docker image tag centos7/base metocherry/centos7-base:latest
