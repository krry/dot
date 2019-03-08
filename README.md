# .dot

## Installation

Who doesn't love a good one-liner?

``` sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/krry/dot/master/dot.sh)"
```

---
## Usage

Dot will turn a pristine machine into a glorybound CLI megazord.\
Initially for Mac. Coming soon for other distros.\
Your dot files will be backed up and datestamped.

## Dependencies

- [Bourne Again Shell](https://www.gnu.org/software/bash/)
- *nix, as new as possible

## The Stack

Here are the mainstays:

- [Neovim](https://neovim.io/) with all the [bells and whistles](#bells-and-whistles).
- [Tmux](https://github.com/tmux/tmux) via a slightly forked [.tmux](https://github.com/krry/.tmux).
- [Fish](https://fishshell.com/) in all its 90s fishy glory.
- [iTerm2](https://www.iterm2.com/) with Powerline fonts

Getting Tmux, Neovim, Fish, and iTerm to play nice can be challenging,\
so I've unified some of the *key* bindings for analogous functions.

## Bells and Whistles

As the fella says, "A JSON library downloaded by 10,000 users, with 3,000 closed issues, and over a 100 unit tests is typically far more robust than the average homegrown JSON library." So we use plugins instead of hand-rolls, for the most part. And we read the docs.

#### N.B.
- vim `<leader>` is `<space>`
- tmux `<prefix>` is `<C-a>`

### Painless Panes

- Seamlessly nav to vim windows or tmux panes (`<C-h>`/`<C-j>`/`<C-k>`/`<C-l>`)
- Horizontal splits with `<leader>s` or `<prefix>s`
- Vertical splits with `<leader>v` or `<prefix>v`

### Copy/Paste

- Universal clipboard/register among vim, tmux, and system (OSX)
- [Easyclip](https://github.com/svermeulen/vim-easyclip)

### Ridiculously Good Looking

- [Papercolor](https://github.com/NLKNguyen/papercolor-theme) - uniform, medium contrast, highly semantic/syntactic highlighting, colorscheming, and theming every which wizzle
- [Fantasque](https://github.com/belluzj/fantasque-sans) - a Powerline-enabled comic (sans) relief typeface there's a stack of other [Powerline fonts](https://github.com/powerline/fonts) fonts too: Hack, Inconsolata, Fira, Source Code, Meslo, Roboto, Nova, Noto, etc.

### Dark Power

Under the hood, it's jam-packed with the latest wizardry from Shougo.
[Denite](https://github.com/Shougo/denite.nvim) will find just about anything
in a flash, and [Deoplete](https://github.com/Shougo/deoplete.nvim) is always
telling me what to type.

### tpopemobile

Easier (but unobstrusive)\
[commenting](https://github.com/tpope/vim-commentary),\
[gitting](https://github.com/tpope/vim-fugitive),\
[repeating](https://github.com/tpope/vim-repeat), and\
[surrounding](https://github.com/tpope/vim-surround).

### Vim-plug

After toying with Vundle a bit, I came running back to junegunn's vim-plug to\
manage all these goodies. Handles a lot flawlessly without a peep.
