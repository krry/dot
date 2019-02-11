# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Themes: ~/.oh-my-zsh/themes/
ZSH_THEME="random"
# ZSH_THEME="awesomepanda"
# ZSH_THEME="adben"

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

# ZSH_CUSTOM=$ZSH/custom
# Plugins: ~/.oh-my-zsh/plugins/*
# Custom: ~/.oh-my-zsh/custom/plugins/
plugins=(git battery brew brew-cask fortune github node torrent osx bower gulp npm)

source $HOME/.profile
source $ZSH/oh-my-zsh.sh

# vim for local && remote editing
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# source other_file_with_zsh_settings.zsh
