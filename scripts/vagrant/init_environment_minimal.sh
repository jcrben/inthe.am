#!/bin/bash
set -x
set -e

echo $(id)
echo $(whoami)
STARTING_DIR=$(pwd)
MAIN_DIR=/var/www/twweb
if [ ! -z "$TRAVIS" ]; then
    MAIN_DIR=$STARTING_DIR
fi
apt-get update
apt-get install -y python-software-properties
# apt-add-repository -y ppa:chris-lea/node.js
apt-get update

apt-get install -y --force-yes python-dev
# Python prerequisites
wget -nv https://bootstrap.pypa.io/get-pip.py
python get-pip.py
pip install virtualenv
pip install wheel

touch $MAIN_DIR/testfile1

echo "setting up virtualenv"
    rm -rf /var/www/envs
    mkdir -p /var/www/envs
    if [ ! -d /var/www/envs/twweb ]; then
        virtualenv /var/www/envs/twweb
        echo $(id)
        echo $(whoami)
        echo $(ls -la $MAIN_DIR)
        echo $(ls -la $MAIN_DIR/scripts/vagrant)
        # printf "\n\nsource $MAIN_DIR/environment_variables.sh\n" >> /var/www/envs/twweb/bin/activate
        sudo cp $MAIN_DIR/scripts/vagrant/environment_variables.sh /
    fi

# apt-get update
# apt-get install -y python-software-properties
# apt-add-repository -y ppa:chris-lea/node.js
# apt-get update

# apt-get install -y --force-yes nodejs
# echo "installing ember-cli and bower"
# if [ -z "$TRAVIS" ]; then
#     # Install a modern version of node
#     npm install -g n
#     n 5.0.0
# else
#     . $HOME/.nvm/nvm.sh
#     nvm install 5
#     nvm use 5
# fi
# export PATH=$MAIN_DIR/node_modules/.bin:$PATH
# npm install -g npm@5.3.0
# npm install -g bower@1.7.6
# npm install ember-cli@2.4.3