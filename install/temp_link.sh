DOTFILES=$HOME/.dotfiles

echo -e "\n\ninstalling ~/.tmuxinator symlinks"
echo "=============================="
if [ ! -d $HOME/.tmuxinator ]; then
    echo "Creating ~/.tmuxinator"
    mkdir -p $HOME/.tmuxinator
fi

echo $DOTFILES

for config in $DOTFILES/tmuxinator/*.yml; do
	target=$HOME/.tmuxinator/$( basename $config )
	if [ -e $target ]; then
		echo "~${target#$HOME} already exists... Skipping."
	else
		echo "Creating symlink for $config"
		ln -s $config $target
	fi
done
