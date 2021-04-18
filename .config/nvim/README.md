# Neovim Setup

1. `brew install neovim`
1. Clone this repo. I like to keep it at `~/.dot/`
2. Replace your local init.vim with an alias to this one and the rest of the
   nvim settings files to the local shared space:

```bash
mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.old
alias ~/.config/nvim/init.vim ~/.dot/nvim/init.vim
alias ~/.local/share/nvim/site ~/.dot/nvim/site
```

3. Then run neovim, install the bundles `nvim ~/.dot/nvim/site/config/00bundles.vim` with Vim Plug `:PlugInstall`
4. Then there's a bunch of Coc.nvim and Denite stuff that you can choose to
   explore. Check coc-settings.json and try `:CocInstall
   coc-{vscode-plugin}`.
