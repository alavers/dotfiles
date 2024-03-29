#!/bin/bash

echo "Installing dotfiles"

source install/link.sh

# install brew dependencies from Brewfile
brew bundle

if [ "$(uname)" == "Darwin" ]; then
    echo "Running on OSX"

    echo "Updating OSX settings"
    source install/osx.sh

   # echo "Adding Karabiner config"
   # source install/karabiner.sh

    echo "Installing node (from nvm)"
    source install/nvm.sh

    echo "Installing misc"
    source install/misc.sh

    echo "Installing ruby stuff"
    source install/ruby.sh
    
    # echo "Configuring nginx"
    # create a backup of the original nginx.conf
    # mv /usr/local/etc/nginx/nginx.conf /usr/local/etc/nginx/nginx.original
    # ln -s ~/.dotfiles/nginx/nginx.conf /usr/local/etc/nginx/nginx.conf
    # symlink the code.dev from dotfiles
    # ln -s ~/.dotfiles/nginx/code.dev /usr/local/etc/nginx/sites-enabled/code.dev
fi

echo "creating vim directories"
mkdir -p ~/.vim-tmp


echo "Configuring zsh as default shell"
chsh -s "$(which zsh)"

echo "Done."
