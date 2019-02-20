


"                    _/
"       _/      _/      _/_/_/  _/_/    _/  _/_/    _/_/_/
"      _/      _/  _/  _/    _/    _/  _/_/      _/
"       _/  _/    _/  _/    _/    _/  _/        _/
"  _/    _/      _/  _/    _/    _/  _/          _/_/_/
"


set nocompatible    " Be iMproved


"                _/                            _/
"   _/      _/      _/_/_/  _/_/    _/_/_/    _/  _/    _/    _/_/_/
"  _/      _/  _/  _/    _/    _/  _/    _/  _/  _/    _/  _/    _/
"   _/  _/    _/  _/    _/    _/  _/    _/  _/  _/    _/  _/    _/
"    _/      _/  _/    _/    _/  _/_/_/    _/    _/_/_/    _/_/_/
"                               _/                            _/
"                              _/                        _/_/


" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Call in the plugins!
call plug#begin(expand('~/.vim/plugins'))

" e.g., Plug 'git_username/git_repo_name'
" TODO: look for redundants in here with `vim-sensible`
Plug 'tpope/vim-sensible'      " sensible defaults
Plug 'tpope/vim-repeat'        " expands dot repeat scope
Plug 'tpope/vim-surround'      " add/change/remove surrounds
Plug 'tpope/vim-commentary'    " quick commenting with 'gcc'
Plug 'tpope/vim-fugitive'      " de facto git integration
Plug 'tpope/vim-rsi'           " adds readline key bindings to vim, smartly
Plug 'itchyny/lightline.vim'   " status bar, better than powerline/airline
Plug 'scrooloose/syntastic'    " syntax checking for lots of langs
Plug 'Yggdroot/indentLine'     " shows vertical lines where spaces indent
Plug 'sheerun/vim-polyglot'    " supports for >140 languages
Plug 'svermeulen/vim-easyclip' " d deletes, m moves, y yanks and more
Plug 'plasticboy/vim-markdown' " deeper markdown support
Plug 'airblade/vim-gitgutter'  " mark lines with changes
Plug 'mileszs/ack.vim'         " adds silver searcher to vim
Plug 'junegunn/vim-easy-align' " vertical alignment made easy
Plug 'Shougo/denite.nvim'      " fuzzy search for anything/files in a project
Plug 'rust-lang/rust.vim'      " Rust syntax, rustfmt, tagbar, playground
Plug 'tomasr/molokai'          " molokai theme for vim
Plug 'mattn/emmet-vim'         " HTML CSS completion
Plug 'stephpy/vim-yaml'        " YAML added magic love
Plug 'xolox/vim-misc'          " supports easytags
Plug 'mattn/webapi-vim'        " puts vim in touch with web APIs (for playpen)
Plug 'xolox/vim-easytags'      " indexes and highlights ctags
Plug 'majutsushi/tagbar'       " show ctags in rightside bar
Plug 'bronson/vim-trailing-whitespace' " highlights trailing spaces in red

call plug#end()

" Required:
filetype plugin on


"           _/                _/_/                      _/    _/
"      _/_/_/    _/_/      _/        _/_/_/  _/    _/  _/  _/_/_/_/    _/_/_/
"   _/    _/  _/_/_/_/  _/_/_/_/  _/    _/  _/    _/  _/    _/      _/_/
"  _/    _/  _/          _/      _/    _/  _/    _/  _/    _/          _/_/
"   _/_/_/    _/_/_/    _/        _/_/_/    _/_/_/  _/      _/_/  _/_/_/


syntax enable                      " turn on syntax highlighting

set autoindent
set autoread
set autowrite
set backspace=indent,eol,start     " allow backspace when inserting
set clipboard^=unnamed,unnamedplus " use system clipboard on OSX or Linux
set directory-=.                   " don't store swap files in current directory
set encoding=utf-8                 " set charset
set expandtab                      " 
set fileformats=unix,mac           " 
set foldlevelstart=5               " 
set hidden                         " enable background buffers
set history=222                    " extend cmd line history
set hlsearch                       " highlight / search matches
set ignorecase                     " ignore case for searches
set incsearch                      " 
set laststatus=2                   " status bar
set linebreak                      " 
set mouse=a                        " enable resizing buffers with mouse, etc.
set mousemodel=popup               " let the mouse pop up
set nobackup                       " 
set nomodeline                     " use modeline overrides
set noshowmode                     " show editor mode below
set noswapfile                     " 
set nowb                           " 
" set nowrap
set nowritebackup                  " 
set number                         " show line numbers
set ruler                          " show where you are
set scrolloff=3                    " show context above/below cursor-line
set shiftwidth=2                   " 
set showcmd                        " show incomplete cmds below
set smartcase                      " 
set smartindent                    " 
set smarttab                       " 
set softtabstop=2                  " assume tabs to be 2 spaces
set t_Co=256                       " 
set tabstop=8                      " 
set textwidth=79                   " allow 79 characters in a line
set title                          " 
set titleold="Terminal"            " 
set titlestring=%F                 " 
set visualbell                     " don't ding, flash
set whichwrap+=<,>,h,l,[,]         " Wrap arrow keys between lines
set wildmenu                       " show a navigable menu for tab completion
set wildmode=longest,list,full     " 



"      _/_/_/  _/    _/  _/  _/_/    _/_/_/    _/_/    _/  _/_/    _/_/_/
"   _/        _/    _/  _/_/      _/_/      _/    _/  _/_/      _/_/
"  _/        _/    _/  _/            _/_/  _/    _/  _/            _/_/
"   _/_/_/    _/_/_/  _/        _/_/_/      _/_/    _/        _/_/_/


" http://vim.wikia.com/wiki/Configuring_the_cursor
" https://github.com/Blaradox/dotFiles/blob/master/vim/.vimrc#L213-L234
" https://stackoverflow.com/questions/42377945/vim-adding-cursorshape-support-over-tmux-ssh

" move cursorline when switching buffers or windows
" augroup Cursorline
"   autocmd!
"   autocmd WinEnter,BufEnter * set cursorline
"   autocmd WinLeave,BufLeave * set nocursorline
" augroup END

" activate cursorline for insert mode
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" to set cursor:
" let &t_EI = '\<Esc>[x q' "where x is:
" 0 => blinking block
" 1 => blinking block
" 2 => solid block
" 3 => blinking underscore
" 4 => solid underscore
" 5 => blinking pipe
" 6 => solid pipe

let &t_SI="[6\ q"
let &t_SR="[4\ q"
let &t_EI="[2\ q"



"                                                    _/
"     _/_/_/  _/_/      _/_/_/  _/_/_/    _/_/_/        _/_/_/      _/_/_/
"    _/    _/    _/  _/    _/  _/    _/  _/    _/  _/  _/    _/  _/    _/
"   _/    _/    _/  _/    _/  _/    _/  _/    _/  _/  _/    _/  _/    _/
"  _/    _/    _/    _/_/_/  _/_/_/    _/_/_/    _/  _/    _/    _/_/_/
"                           _/        _/                            _/
"                          _/        _/                        _/_/


" elect a <leader>
let mapleader = ','

" Move things down a line
nmap <cr> O<esc>

" Add a single character
nnoremap <space>i i_<esc>r
nnoremap <space>a a_<esc>r

" Autoindent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Pane splitting
noremap <leader>s :<C-u>split<cr>
noremap <leader>v :<C-u>vsplit<cr>

" Pane navigation
noremap <C-h> <C-w>h
inoremap <C-h> <esc><C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Show the tree
nnoremap <leader><Tab> :Lexplore<CR>

" Tab for tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<cr>

" Jetpack between buffers
nnoremap <leader>l :ls<CR>:b<Space>

" set working directory to here
nnoremap <leader>. :lcd %:p:h<cr>

" find files by name
set path+=**
nnoremap <leader>f :find *
nnoremap <leader>s :sfind *
nnoremap <leader>v :vert sfind *
nnoremap <leader>t :tabfind *

" Clear search (and its highlighting)
noremap <leader>/ :let @/ = ""<CR>

" Reload .vimrc
noremap <silent> <leader>V :source $MYVIMRC<cr>:exe ":echo 'vimrc reloaded'"<cr>

" Save, close, quit
noremap <silent> <leader>u :update<cr>
noremap <silent> <C-s> :update<cr>
noremap <silent> <C-x> :x<cr>
noremap <silent> <C-q> :q<cr>
inoremap <silent> <C-s> <esc>:update<cr>i
inoremap <silent> <C-x> <esc>:x<cr>
inoremap <silent> <C-q> <esc>:q<cr>

" pbcopy for OSX copy/paste
if has('macunix')
  vmap <C-x> :!pbcopy<cr>
  vmap <C-c> :w !pbcopy<cr><cr>
endif



"                            _/      _/      _/
"       _/_/_/    _/_/    _/_/_/_/_/_/_/_/      _/_/_/      _/_/_/    _/_/_/
"    _/_/      _/_/_/_/    _/      _/      _/  _/    _/  _/    _/  _/_/
"       _/_/  _/          _/      _/      _/  _/    _/  _/    _/      _/_/
"  _/_/_/      _/_/_/      _/_/    _/_/  _/  _/    _/    _/_/_/  _/_/_/
"                                                           _/
"                                                      _/_/

" Determine operating system
if !exists('g:os')
  if has('win64') || has('win32') || has('win16')
    let g:os = "Windows"
  else
    let g:os = substitute(system('uname'), '\n', '', '')
  endif
endif

" set dictionary to Mac dict
if g:os == "Darwin"
  set dictionary=/usr/share/dict/words
endif

" allow mouse with TMUX
if exists('$TMUX')
  set ttymouse=xterm
endif

" include fugitive in status line
if exists('*fugitive#statusline')
  set statusline+=%{fugitive#statusline()}
endif

" make final column visible as black gutter
if (exists('+colorcolumn'))
  set colorcolumn=80
  highlight ColorColumn ctermbg=8
endif

if &term =~ '256color'
  set t_ut=
endif

" set theme
if !exists('g:not_finish_vimplug')
  colorscheme molokai
endif

" Highlight up to 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"")
        \ <= line("$") | exe "normal! g`\"" | endif
augroup END

" PYTHON
au BufNewFile,BufRead *.py set fileformat=unix

" HTML/CSS/JS
augroup BufNewFile,BufRead *.{html, js, css}
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
  " turns on html autocomplete
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
augroup END

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" MARKDOWN
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown

function! s:setupWrapping()
  setl wrap
  setl wm=2
  setl textwidth=79
  setl nolist
  map <buffer> <Leader>p :Mm <CR>
endfunction

augroup FileType markdown
  call s:setupWrapping()
  " code blocks for markdown
  " inoremap <buffer><silent><unique> ~~~ ~~~<Enter>~~~<C-o>k<C-o>A
  " inoremap <buffer><silent><unique> ``` ```<Enter>```<C-o>k<C-o>A
augroup END

" Filesystem tree navigator
let g:netrw_banner = 0 " excise banner
let g:netrw_browse_split = 0 " not sure
let g:netrw_liststyle = 3 " tree mode
let g:netrw_altv = 1 " open in vertical split right
let g:netrw_preview = 1 " vertical previews
let g:netrw_winsize = 20 " 20% wide tree
let g:netrw_list_hide = '.*\.swp,.git/'



"                  _/                      _/
"       _/_/_/    _/  _/    _/    _/_/_/      _/_/_/      _/_/_/
"      _/    _/  _/  _/    _/  _/    _/  _/  _/    _/  _/_/
"     _/    _/  _/  _/    _/  _/    _/  _/  _/    _/      _/_/
"    _/_/_/    _/    _/_/_/    _/_/_/  _/  _/    _/  _/_/_/
"   _/                            _/
"  _/                        _/_/


" Git cmds
noremap <leader>ga :Gwrite<cr>
noremap <leader>gc :Gcommit<cr>
noremap <leader>gsh :Gpush<cr>
noremap <leader>gll :Gpull<cr>
noremap <leader>gs :Gstatus<cr>
noremap <leader>gd :Gvdiff<cr>
noremap <leader>gr :Gremove<cr>
nnoremap <leader>o :.Gbrowser<cr>

" Ack search contents of current directory
nnoremap <space>/ :Ack<space>
" use the word under the cursor for Ack search
nmap * :Ack <c-r>=expand("<cword>")<cr><cr>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
vnoremap <silent> <Enter> :EasyAlign<cr>

" denite file search (c-p uses gitignore, c-o looks at everything)
nnoremap <space><space> :DeniteProjectDir -buffer-name=git -direction=top file_rec/git<CR>
" map <C-O> :DeniteProjectDir -buffer-name=files -direction=top file_rec<CR>

" syntastic
let g:syntastic_always_populate_loc_list=1

" lightline status bar
" TODO: configure the status line
let g:lightline = {
  \   'active': {
  \     'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \     'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \   },
  \ }

" search contents of project files
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack
let g:ackprg = 'ag --vimgrep --smart-case'

" denite fuzzy file search options
" -u flag to unrestrict (see ag docs)
call denite#custom#var('file_rec', 'command',
      \ ['ag', '--follow', '--nocolor', '--nogroup', '-u', '-g', ''])
call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
      \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

