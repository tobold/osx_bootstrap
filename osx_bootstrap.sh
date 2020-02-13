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
brew bundle --no-lock

if [ ! -x ~/.oh-my-zsh ]
then
  echo "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [ ! -x ~/.oh-my-zsh/plugins/zsh-autosuggestions ]
then
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
fi

if [ ! -x ~/.nvm ]
then
  echo "Installing NVM"
  mkdir ~/.nvm
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
fi

rm ~/.zshrc
ln -s "$(pwd)/.zshrc" ~/.zshrc

rm ~/.tetris_aliases
ln -s "$(pwd)/.tetris_aliases" ~/.tetris_aliases

rm ~/.ssh/config
ln -s "$(pwd)/.sshconfig" ~/.ssh/config

#setup git ignore global and symlink
rm ~/.gitignore_global
ln -s "$(pwd)/.gitignore_global" ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
git config --global pull.rebase true
