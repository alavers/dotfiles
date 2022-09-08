#!/usr/bin/env zsh

DOTFILES=$HOME/.dotfiles

get_linkables() {
    find -H "$DOTFILES" -maxdepth 3 -name '*.symlink'
}

echo -e "\nCreating symlinks"
echo "=============================="
for file in $(get_linkables); do
    target="$HOME/.$( basename $file ".symlink" )"
    if [ -e $target ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $file"
        ln -s $file $target
    fi
done

echo -e "\n\ninstalling to ~/.config"
echo "=============================="
if [ ! -d $HOME/.config ]; then
    echo "Creating ~/.config"
    mkdir -p $HOME/.config
fi
# configs=$( find -path "$DOTFILES/config.symlink" -maxdepth 1 )
for config in $DOTFILES/config/*; do
    target=$HOME/.config/$( basename $config )
    if [ -e $target ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $config"
        ln -s $config $target
    fi
done

echo -e "\n\ninstalling ~/.tmuxinator symlinks"
echo "=============================="
if [ ! -d $HOME/.tmuxinator ]; then
    echo "Creating ~/.tmuxinator"
    mkdir -p $HOME/.tmuxinator
fi

for config in $DOTFILES/tmuxinator/*.yml; do
	target=$HOME/.tmuxinator/$( basename $config )
	if [ -e $target ]; then
		echo "~${target#$HOME} already exists... Skipping."
	else
		echo "Creating symlink for $config"
		ln -s $config $target
	fi
done

# create vim symlinks
# As I have moved off of vim as my full time editor in favor of neovim,
# I feel it doesn't make sense to leave my vimrc intact in the dotfiles repo
# as it is not really being actively maintained. However, I would still
# like to configure vim, so lets symlink ~/.vimrc and ~/.vim over to their
# neovim equivalent.

echo "\nCreating vim symlinks"
echo "=============================="

VIMFILES=( "$HOME/.vim:$DOTFILES/config/nvim"
         "$HOME/.vimrc:$DOTFILES/config/nvim/init.vim" )


for file in "${VIMFILES[@]}" ; do
	KEY=${file%%:*}
	VALUE=${file#*:}
	if [ -e ${KEY} ]; then
        	echo "${KEY} already exists... skipping"
	else
        	echo "Creating symlink for $KEY"
        	ln -s ${VALUE} ${KEY}
	fi
done

