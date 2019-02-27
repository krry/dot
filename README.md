# dotfiles

## Installation

``` sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/krry/dot/master/liftoff.sh)"
```
---

Who doesn't love a one-liner?

## Features

Using tmux, vim, and zsh together can be confusing
so I've unified many of the keybindings for analogous functions.

### pane splitting and switching
- seamlessly nav to vim windows or tmux panes (<C-h>/<C-j>/<C-k>/<C-l>)
- make horizontal split with `<leader>s` or `<prefix>s`
- split vertically with `v`
- vim `<leader>` is `,`
- tmux `<prefix>` is `<C-a>`

### status bars
- tmux takes a theme from tmux-themepack
- vim uses lightline for its status bar
- vim uses syntax highlighting from syntastic
- zsh uses custom prompt and plugins from `oh-my-zsh`

### copy/paste
- universal clipboard among vim, tmux, and system (OSX)
- vim easyclip
  - copy: y to yank, yy to yank line, Y to copy to line end
  - cut: m to move, mm to move line, ...
  - delete: d to delete, dd to delete line, D to delete to line end
  - paste: p to put, P to put line

