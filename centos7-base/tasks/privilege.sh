#/usr/env/bin bash

docker run -d \
  --privileged \
  --name centos7-base \
  centos:centos7 \
  /sbin/init
