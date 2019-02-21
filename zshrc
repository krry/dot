#
# Executes commands at the start of an interactive session.
#
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
else
  echo "Prezto not found. Try https://github.com/sorin-ionescu/prezto"
fi

unsetopt CORRECT   # Disable autocorrect guesses

expand-or-complete-with-dots() { # displays red dots when autocompleting
  echo -n "\e[31m......\e[0m"      # a command with the tab key, "Oh-my-zsh"-style.
  zle expand-or-complete
  zle redisplay
}

zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

# let <C-s> pass through to vim instead of slowing output
stty -ixon

# octave for ML
alias octave='octave-cli --no-window-system'

# giving homebrew priority
alias vi=/usr/local/bin/vim
alias vim=/usr/local/bin/vim
alias zsh=/usr/local/bin/zsh
alias pip=/usr/local/bin/pip3
alias py=/usr/local/bin/python3

# current project shortcuts
alias atma="cd $HOME/Drive/Code/web/atmanaut"
alias chakra="cd $HOME/Drive/Code/web/atmanaut/themes/chakra"
alias dotty="cd $HOME/dotfiles"

# upgrades for common utilities
alias cat=lolcat    # rainbow cat
alias rm=trash      # safe removal: trash -l to list, trash -e to empty

alias gad="git add ."

source ~/dotfiles/zsh/custom/vi_mode.zsh
