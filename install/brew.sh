#!/bin/sh

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing homebrew packages..."

# cli tools
brew install ack
brew install tree
brew install wget

# git tools
brew install git-secrets
brew install --HEAD homebrew/head-only/gitstats

# development server setup
brew install nginx
brew install dnsmasq

# development tools
brew install antigen
brew install gnupg
brew install git
brew install hub
brew install reattach-to-user-namespace
brew install tmux
brew install zsh
brew install highlight
brew install nvm
brew install z
brew install markdown
brew install diff-so-fancy
brew install heroku
brew install go
brew install jid
brew install python
brew install python3
brew install fasd
brew install fzf

# databases
brew install redis
brew install mongodb

# install neovim
brew install neovim/neovim/neovim

# universal ctags
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
exit 0
