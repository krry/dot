" download vim-plug if missing
if empty(glob("~/.vim/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fsSLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif

" declare plugins
silent! if plug#begin()

  Plug 'airblade/vim-gitgutter'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'tpope/vim-fugitive'
  Plug 'vim-syntastic/syntastic'
  Plug 'sharkdp/bat'
  Plug 'dandavison/delta'
  Plug 'yggdroot/indentLine'
  Plug 'tpope/vim-vinegar'
  Plug 'junegunn/vim-easy-align'
  Plug 'honza/vim-snippets'
  Plug 'tpope/vim-commentary'

  " ignore these on older versions of vim
  if v:version >= 703
    Plug 'gorodinskiy/vim-coloresque'
    Plug 'jamessan/vim-gnupg'
  endif
  if v:version >= 704
    Plug 'vim-pandoc/vim-pandoc-syntax'
  endif

  call plug#end()
endif

nnoremap <Leader>f :fzf<CR>
