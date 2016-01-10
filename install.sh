#
# node.dots
#
# Steps for installing Node.js and my favorite npm packages
#
# Author: André König <andre.koenig@posteo.de>
#

NODE_VERSION=v4.2.4

if [ ! -d  $HOME/.nvm ]; then
	dots_output_info "NVM is not installed. Installing it ..."

	git clone https://github.com/creationix/nvm.git $HOME/.nvm && cd $HOME/.nvm && git checkout `git describe --abbrev=0 --tags`

	source "$HOME/.nvm/nvm.sh"

	dots_profile_add "source $HOME/.nvm/nvm.sh"
fi

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
