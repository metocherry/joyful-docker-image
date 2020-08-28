#/usr/bin/env bash

yum install -y dnf
dnf update -y

## Install Git
dnf install -y git
git --version
