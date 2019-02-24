# dotfiles

## TODO

Which shell should start the process? All in bash until the prezto part?
Can I install the Piperita.terminal files? And make that the default in set-defaults.sh.

## Installation

Who doesn't love a one-liner?

``` sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/krry/dot/mac/configure.sh)"
```
---

## Features

Using tmux, vim, and zsh together can be confusing
so I've unified many of the keybindings for analogous functions.

### Vi mode in `zsh` and `tmux`
- INS mode: underline cursor
- CMD mode: block cursor
- tmux: green cursor
- vim: blue cursor
- zsh: white cursor

### pane splitting and switching
- navigate with vi keys (h/j/k/l)
- make horizontal split with `s`
- split vertically with `v`
- vim: modify with Ctrl, e.g. `^h` switches to left vim pane
- tmux: modify with `<prefix>`, e.g. <C-a>k switches to tmux pane above

### status bars
- tmux takes a theme from tmux-themepack
- vim uses lightline for its status bar
- vim uses syntax highlighting from syntastic
- zsh uses custom prompt and plugins from `oh-my-zsh`

### copy/paste
- universal clipboard among vim, tmux, and system (OSX)
- tmux copy-mode
  - `<prefix>[` to enter
  - `<space>` to start highlighting
  - `<e`nter> to copy and exit copymode
  - `<prefix>]` to paste
- vim easyclip
  - copy: y to yank, yy to yank line
  - cut: m to move, mm to move line
  - paste: p to put, P to put line
  - delete: d to delete, dd to delete line


### plugins
- oh-my-zsh loads plugins to zsh via $ZSH/plugins and $ZSH/custom/plugins
- vim loads plugins with vim-plug, which are managed as submodules in this repo
- tmux takes a theme from ~/.tmux-themepack

### customizability
- zsh takes custom settings and aliases from $ZSH/custom/*

## dependencies
- oh-my-zsh
- tmux-themepack
- vim-plug - this is set up to autoload in `.vimrc`
- vim plugins as [`.gitmodules`](./.gitmodules)

### gratitude
- to Micah Elliott for cursor magic among zsh, tmux, and vim: http://micahelliott.com/posts/2015-07-20-vim-zsh-tmux-cursor.html
- to @oselivanov for lending me some sugar for vi mode in zsh https://github.com/oselivanov/zsh-vi-done-right
- to @tpope, @junegunn, @Shougo, and all the authors of the vim plugins used here
