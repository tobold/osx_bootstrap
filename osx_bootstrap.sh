#!/usr/bin/env bash
set +e

if [ ! -x /usr/local/bin/brew ]
then
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
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
then  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
fi

if [ ! -x ~/.oh-my-zsh/plugins/zsh-better-npm-completion ]
then git clone https://github.com/lukechilds/zsh-better-npm-completion ~/.oh-my-zsh/plugins/zsh-better-npm-completion
fi


if [ ! -x ~/.nvm ]
then
  echo "Installing NVM"
  mkdir ~/.nvm
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
fi

ln -sf "$(pwd)/.zshrc" ~/.zshrc
ln -sf "$(pwd)/.tetris_aliases" ~/.tetris_aliases
ln -sf "$(pwd)/.sshconfig" ~/.ssh/config

#setup git ignore global and symlink
ln -sf "$(pwd)/.gitignore_global" ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
git config --global pull.rebase true

echo --- Which email address are you using for git? ---
read emailaddress

git config --global user.name "Toby Hamand"
git config --global user.email $emailaddress