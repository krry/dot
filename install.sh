# # dotfiles installer

# # vim
# ln -s vimrc "${HOME}/.vimrc"
# ln -s vim "${HOME}/.vim"

# # tmux
# ln -s tmux/.tmux.conf "${HOME}/.tmux.conf"
# cp tmux/.tmux.conf.local $HOME

# # clone prezto
# git clone --recursive https://github.com/krry/prezto "${ZDOTDIR:-$HOME}/.zprezto"

# # symlink zsh dotfiles
# for $rcfile in "${ZDOTDIR:-$HOME}/.zprezto/runcoms/^README.md(.N)"; do
#   ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
# done

# exec zsh
