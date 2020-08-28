#!/usr/bin/env bash

dnf update -y
dnf install -y langpacks-en net-tools

localectl set-locale LANG=en_US.UTF-8


# Intall Git
dnf install -y git
git --version

#Install NodeJS
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install --lts
node -v
npm -v
