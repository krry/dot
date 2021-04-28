source ~/.zsh_aliases

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

eval "$(rbenv init -)"
eval "$(direnv hook zsh)"
eval source <("/opt/homebrew/bin/starship" init zsh --print-full-init)
Kamadhenu

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node


zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
	zdharma/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
	zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
	zsh-users/zsh-completions

# Plugin history-search-multi-word loaded with investigating.
zinit light zdharma/history-search-multi-word

# fzf - fuzzy finder
zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin

# z - jump around
zinit wait lucid for \
	"agkozak/zsh-z"

# make'!...' -> run make before atclone & atpull
zinit ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' src"zhook.zsh"
zinit light direnv/direnv

# colors for ls and exa
zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
	atpull'%atclone' pick"clrs.zsh" nocompile'!' \
	atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS
### End of Zinit's installer chunk
