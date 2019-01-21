#!/bin/bash
set -x
set -e

STARTING_DIR=$(pwd)
MAIN_DIR=/var/www/twweb
if [ ! -z "$TRAVIS" ]; then
    MAIN_DIR=$STARTING_DIR
fi

apt-get update
apt-get install -y python-software-properties
apt-add-repository -y ppa:chris-lea/node.js
apt-get update

apt-get install -y --force-yes nodejs
echo "installing ember-cli and bower"
if [ -z "$TRAVIS" ]; then
    # Install a modern version of node
    npm install -g n
    n 5.0.0
else
    . $HOME/.nvm/nvm.sh
    nvm install 5
    nvm use 5
fi
export PATH=$MAIN_DIR/node_modules/.bin:$PATH
npm install -g npm@5.3.0
npm install -g bower@1.7.6
npm install ember-cli@2.4.3