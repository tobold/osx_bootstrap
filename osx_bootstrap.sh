#!/usr/bin/env bash
set -e

if [ ! -x /usr/local/bin/brew ]
then
    echo "Installing Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Homebrew already installed, checking for updates"
    brew update
fi

echo "Installing brew packages"
brew bundle

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Creating .zshrc symlink"
ln -s ./.zshrc ~/.zshrc