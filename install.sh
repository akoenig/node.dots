#
# node.dots
#
# Steps for installing Node.js and my favorite npm packages
#
# Author: André König <andre.koenig@posteo.de>
#

NODE_VERSION=v4.2.4

mkdir -p $HOME/.apps

BASE=$HOME/.apps/nvm

git clone https://github.com/creationix/nvm.git $BASE && cd $BASE && git checkout `git describe --abbrev=0 --tags`

source "$BASE/nvm.sh"

dots_profile_add "source $BASE/nvm.sh"

nvm install $NODE_VERSION
nvm alias default $NODE_VERSION

#
# npm configuration
#
npm config set spin false
npm config set loglevel http

#
# Install favorite npm packages
#
cat $SELF/packages | xargs -L 1 npm i -g

dots_output_success "Installed Node.js ($NODE_VERSION) and favorite npm packages."
