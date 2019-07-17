#!/bin/sh

echo "Installing python 2 provider..."
pip uninstall pynvim neovim
pip install pynvim
pip install neovim

echo "Installing python 3 provider..."
pip3 uninstall pynvim neovim
pip3 install pynvim
pip3 install neovim

echo "Installing ruby provider..."
gem install neovim

echo "Installing node.js provider..."
npm install -g neovim
