#!/usr/bin/env bash

set -e # stop script if error occurs.

# Init
sudo apt-get update -q

sudo apt-get install -y git

# Install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
echo ". ~/.nvm/nvm.sh" >> ~/.bashrc
source ~/.bashrc

# Install LTS version of node
nvm use 4.2.6
