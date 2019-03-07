# dotfiles

## Installation

Who doesn't love a good one-liner?

``` sh
cd ~ && bash -c "$(curl -fsSL https://raw.githubusercontent.com/krry/dot/master/dot.sh)"
```

---
## Usage

Intended for OS X.
This will turn a pristine machine into a glorybound CLI hound.

## Features

Here are the mainstays:

- Neovim with all the bells and whistles (see [Plugins](#plugins))
- Tmux nicely configured via [.tmux](https://github.com/krry/.tmux).
- Fish in all its fishy glory.
- iTerm2 with a few minor customizations.
- Homebrew will do the early work.

Getting Tmux, Neovim, Fish, and iTerm to play nice can be challenging,
so I've unified some of the *key* bindings for analogous functions.

- vim `<leader>` is `<space>`
- tmux `<prefix>` is `<C-a>`

### Painless Panes

- seamlessly nav to vim windows or tmux panes (<C-h>/<C-j>/<C-k>/<C-l>)
- horizontal split with `<leader>s` or `<prefix>s`
- vertical split with `<leader>v` or `<prefix>v`

### Copy/Paste

- universal clipboard among vim, tmux, and system (OSX)
- vim easyclip
  - copy: y to yank, yy to yank line, Y to copy to line end
  - cut: m to move, mm to move line, ...
  - delete: d to delete, dd to delete line, D to delete to line end
  - paste: p to put, P to put line

### Papercolor

- a lovely medium contrast colorscheme applied everywhere

### Opinions!

They are underdeveloped, like a disappointing Polaroid. But they are right
there in your face anyway, just like anyone else's.

## Plugins

### Dark Power

Under the hood, it's jam-packed with the latest wizardry from Shougo.
TBH I've only just begun to understand how to rev these babies up.
But Denite will find just about anything in a flash,
and Deoplete is always telling me what to type.

### Does tpope shit in the woods?

I wouldn't know. But he does make Vimming a lot slicker. Thanks to him we've
got easier comments, sessions, gitting, repeating, and surrounding. Bless you
sir!

### Vim-plug

After toying with Vundle a bit, I came running back to junegunn's vim-plug to
manage all these goodies. Handles a lot flawlessly without a peep.
