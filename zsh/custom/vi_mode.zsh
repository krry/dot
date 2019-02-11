# ###############
# VI_MODE for ZSH
# vi mode in ZSH needs some help
# these settings help the cursor reflect the vi mode
# and shore up some discrepancies with vim proper
# ###############

# vi all the things
bindkey -v

# remove delay from mode-switching with <ESC>
export KEYTIMEOUT=1

# Disable moving one char back after switching to insert mode.
vi-esc-fix() {
  zle vi-cmd-mode
  zle forward-char
}
zle -N vi-esc-fix
bindkey -r "\e"
bindkey -M viins "\e" vi-esc-fix

# Hit e in command mode to edit current command line.
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd e edit-command-line

# Modal cursor color for vi's insert/normal modes.

# Color shortcuts initialization.
autoload -U colors
colors
# TODO: use `colors` in prompt styling below

# http://micahelliott.com/posts/2015-07-20-vim-zsh-tmux-cursor.html

zle-line-init () {
  zle -K viins
    echo -ne "\033]12;Gray\007"
    echo -ne "\033[4 q"
} # on a new line in the shell, use the gray underline

zle -N zle-line-init

zle-keymap-select () {
# in CMD mode in TMUX use a green block
  if [[ $KEYMAP == vicmd ]]; then
    if [[ -z $TMUX ]]; then
      printf "\033]12;Green\007"
        printf "\033[1 q"
    else # in CMD mode in ZSH use a red block
      printf "\033Ptmux;\033\033]12;red\007\033\\"
        printf "\033Ptmux;\033\033[1 q\033\\"
    fi
  else # in INS mode in TMUX, use a gray underline
    if [[ -z $TMUX ]]; then
      printf "\033]12;Grey\007"
        printf "\033[4 q"
    else # in INS mode in ZSH use a gray underline
      printf "\033Ptmux;\033\033]12;grey\007\033\\"
        printf "\033Ptmux;\033\033[4 q\033\\"
    fi
  fi
}

zle -N zle-keymap-select

# add more vim bindings to zsh
bindkey "^?" backward-delete-char

