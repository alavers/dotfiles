BASEDIR=$(dirname "$0")
cat "$BASEDIR/../misc/get.rvm.io" | bash -s stable

echo "Installing latest version of ruby"
rvm install ruby

echo "Installing tmuxinator"
gem install tmuxinator
