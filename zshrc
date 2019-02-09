# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Themes: ~/.oh-my-zsh/themes/
ZSH_THEME="random"
# ZSH_THEME="awesomepanda"

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

# ZSH_CUSTOM=$ZSH/custom
# Plugins: ~/.oh-my-zsh/plugins/*
# Customs: ~/.oh-my-zsh/custom/plugins/
plugins=(git brew brew-cask github node torrent osx bower gulp npm)

source $HOME/.profile
source $ZSH/oh-my-zsh.sh

# vim all the things
bindkey -v
export KEYTIMEOUT=1

# flip to beam cursor
_fix_cursor() {
  echo -ne '\e[5 q'
}

# start zsh with beam cursor in insert mode
precmd_functions+=(_fix_cursor)

# if in NORMAL mode show a block cursor, otherwise beam
function zle-line-init zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
    [[ $1 = 'block' ]]; then
      echo -ne '\e[1 q'

    elif [[ ${KEYMAP} == main ]] ||
      [[ ${KEYMAP} == viins ]] ||
      [[ ${KEYMAP} = '' ]] ||
      [[ $1 = 'beam' ]]; then
      _fix_cursor
  fi
}

# bind cursor switcher to zsh line editor
zle -N zle-line-init
zle -N zle-keymap-select

# add more vim bindings to zsh
bindkey "^?" backward-delete-char

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

# source local aliases
source ~/.zsh/aliases
