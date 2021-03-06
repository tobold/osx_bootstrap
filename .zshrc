# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# add ssh key to keyring
if [ -x ~/.ssh/id_rsa ]
then
ssh-add -K ~/.ssh/id_rsa
else if [ -x ~/.ssh/id_ed25519 ]
ssh-add -K ~/.ssh/id_ed25519
fi

# Path to your oh-my-zsh installation.
export ZSH=/Users/$USER/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-autosuggestions
)

export ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
alias webstorm='open -a "WebStorm.app" "$@"'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tobyhamand/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/tobyhamand/google-cloud-sdk/path.zsh.inc'; fi

# added by Miniconda3 4.5.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/tobyhamand/miniconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/tobyhamand/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/tobyhamand/miniconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/tobyhamand/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

# add rabbitmqadmin to path
export PATH="/usr/local/Cellar/rabbitmq/3.7.16/sbin:${PATH}"

# set git config settings
git config --global rebase.autoStash true

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/toby/Work/trint-backend/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/toby/Work/trint-backend/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/toby/Work/trint-backend/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/toby/Work/trint-backend/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/toby/Work/trint-backend/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/toby/Work/trint-backend/node_modules/tabtab/.completions/slss.zsh

export AWS_PROFILE=cazoo
export AWS_REGION=eu-west-1
