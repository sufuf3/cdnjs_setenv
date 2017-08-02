#!/bin/sh

DIR=~/
cd $DIR

# install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
. ~/.nvm/nvm.sh && nvm install 4
. ~/.nvm/nvm.sh && nvm ls
. ~/.bashrc

# cdnjs repo
mkdir ~/cdnjs
cd ~/cdnjs && \
    git init && \
    git config --global core.editor vim && \
    git config core.sparseCheckout true && \
    git remote add origin https://github.com/cdnjs/cdnjs.git && \
    git remote add origin2 git://cdnjs.peterdavehello.org/cdnjs && \
    git remote -v
wget https://github.com/cdnjs/cdnjs/raw/master/tools/sparse-checkout.template -O ~/cdnjs/.git/info/sparse-checkout
echo '/ajax/libs/jquery/*' >> ~/cdnjs/.git/info/sparse-checkout

cd ~/cdnjs && \
    git pull origin2 master
cd ~/cdnjs && \
    npm install && \
    npm test

# Install the minify tool
cd $DIR && \
    git clone https://github.com/PeterDaveHello/web-minify-helper.git
cd ~/web-minify-helper && \
    npm install && \
    git submodule update --init

# Auto-update
cd $DIR && \
    git clone https://github.com/cdnjs/autoupdate

# Create some folders
mkdir ~/git_repo
mkdir ~/node_modules



