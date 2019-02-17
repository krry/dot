
"""""""""""""""""""""""""""""""""""""
"""  .vimrc                         "
"""                                 "
"""                                 "
"""""""""""""""""""""""""""""""""""""

set nocompatible    " Be iMproved

"""""""""""""""""""""""""""
""" Plugins               "
"""                       "
"""""""""""""""""""""""""""
let vimplug_exists=expand('~/.vim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You will need to install curl to install vim-plug. Abandon shell!"
    execute "q!"
  endif
  echo "Installing vim-plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" begin to call in the plugins
call plug#begin(expand('~/.vim/plugins'))

" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'tpope/vim-sensible'      " sensible defaults
" TODO: look for redundants in here with `vim-sensible`
Plug 'tpope/vim-repeat'        " expands dot repeat scope
Plug 'tpope/vim-surround'      " add/change/remove surrounds
Plug 'tpope/vim-commentary'    " quick commenting with 'gcc'
" Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'      " de facto git integration
Plug 'itchyny/lightline.vim'   " status bar, better than powerline/airline
Plug 'scrooloose/syntastic'    " syntax checking for lots of langs
Plug 'Yggdroot/indentLine'     " shows vertical lines where spaces indent
Plug 'sheerun/vim-polyglot'    " supports for >140 languages
Plug 'svermeulen/vim-easyclip' " d deletes, m cuts, and more
Plug 'plasticboy/vim-markdown' " deeper markdown support
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'         " adds silver searcher to vim
Plug 'junegunn/vim-easy-align' " vertical alignment made easy
Plug 'bronson/vim-trailing-whitespace' " highlights trailing spaces in red

let g:make = 'gmake'
if exists('make')
  let g:make = 'make'
endif
" Plug 'Shougo/vimproc.vim', { 'do': g:make }
Plug 'Shougo/denite.nvim'
" Colors
Plug 'tomasr/molokai'

" HTML CSS JS
Plug 'mattn/emmet-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'jelera/vim-javascript-syntax'

" YAML added magic love
Plug 'stephpy/vim-yaml'

call plug#end()

" Required:
filetype plugin on

""""""""""""""""""""""""""""
"""  End Plugins           "
"""                        "
""""""""""""""""""""""""""""

""""""""""""""""""""""""""""
"""  Config                "
"""                        "
""""""""""""""""""""""""""""

syntax enable                   " turn on syntax highlighting

set ruler                       " show where you are
set number                      " show line numbers
set backspace=indent,eol,start  " allow backspace when inserting
set history=222                 " extend cmd line history
set showcmd                     " show incomplete cmds below
set noshowmode                  " show editor mode below
set visualbell
set autoread
set hidden                      " enable background buffers
set scrolloff=3                 " show context above/below cursor-line
set wildmenu                    " show a navigable menu for tab completion
set wildmode=longest,list,full
set t_Co=256
set mousemodel=popup
set mouse=a                     " enable basic mouse behavior, e.g., resizing buffers
set autowrite
set nocursorline
set nowritebackup
set whichwrap+=<,>,h,l,[,]      " Wrap arrow keys between lines
set noswapfile
set nobackup
set nowb
set directory-=.                " don't store swap files in current directory

if exists('$TMUX')
  set ttymouse=xterm
endif

" makes fzf available within vim, installed via homebrew
set rtp+=/usr/local/opt/fzf

" use system clipboard on OSX or Linux
set clipboard^=unnamed,unnamedplus

" status bar
set laststatus=2

" use modeline overrides
set nomodeline
" set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

if exists('*fugitive#statusline')
  set statusline+=%{fugitive#statusline()}
endif

" detects $TERM and sets color mode accordingly
if has('gui_running')
  if has('gui_mac') || has('gui_macvim')
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
  endif
endif

if &term =~ '256color'
  set t_ut=
endif

let no_buffers_menu=1
if !exists('g:not_finish_vimplug')
    colorscheme molokai
endif

"""""""""""""""""""""""""""
""" Indentation           "
"""                       "
"""""""""""""""""""""""""""

set autoindent
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
" set nowrap
set linebreak
" set textwidth=79
" make final column visible as black gutter
if (exists('+colorcolumn'))
  set colorcolumn=80
  highlight ColorColumn ctermbg=8
endif
set foldlevelstart=5

" Encoding
set encoding=utf-8
set backspace=indent,eol,start
set fileformats=unix,mac

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase

" python style guide
au BufNewFile,BufRead *.py set fileformat=unix

" web style guide
augroup BufNewFile,BufRead *.{html, js, css}
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
  " turns on html autocomplete
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
augroup END

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" markdown style guide
function! s:setupWrapping()
  setl wrap
  setl wm=2
  setl textwidth=79
  setl nolist
  map <buffer> <Leader>p :Mm <CR>
endfunction

au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown

augroup FileType markdown
  call s:setupWrapping()
  " code blocks for markdown
  " inoremap <buffer><silent><unique> ~~~ ~~~<Enter>~~~<C-o>k<C-o>A
  " inoremap <buffer><silent><unique> ``` ```<Enter>```<C-o>k<C-o>A
augroup END

" highlight up to 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

" remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"")
        \ <= line("$") | exe "normal! g`\"" | endif
augroup END


""""""""""""""""""""""""""
"" Mappings              "
""                       "
""""""""""""""""""""""""""

let mapleader = ','

" add new lines
nmap <cr> O<esc>
" nmap <S-Enter> O<esc>

" autoindent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" easier pane splitting
noremap <leader>s :<C-u>split<cr>
noremap <leader>v :<C-u>vsplit<cr>

" easier vim pane navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" clear search (and its highlighting)
noremap <leader>/ :let @/ = ""<CR>

" fuzzy file search
" nnoremap <leader>b :CtrlPBuffer<CR>
" nnoremap <leader>t :CtrlP<CR>
" nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>

" toggle local fold with spacebar
" nnoremap <space> za

" nnoremap <leader>d :NERDTreeToggle<CR>
" nnoremap <leader>f :NERDTreeFind<CR>
" nnoremap <leader>] :TagbarToggle<CR>
" nnoremap <leader><space> :call whitespace#strip_trailing()<CR>
" nnoremap <leader>g :GitGutterToggle<CR>

" reload .vimrc quickly
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
nnoremap <silent> <leader>S <Esc>:w<cr>
command Rch <leader>h:e ~/dotfiles/vimrc<cr>

" http://vim.wikia.com/wiki/Configuring_the_cursor
" http://micahelliott.com/posts/2015-07-20-vim-zsh-tmux-cursor.html
" Tmux details: http://reza.jelveh.me/2011/09/18/zsh-tmux-vi-mode-cursor
"
" to set cursor:
" let &t_EI = '\<Esc>[x q' "where x is:
" 0 => blinking block
" 1 => blinking block
" 2 => solid block
" 3 => blinking underscore
" 4 => solid underscore
" 5 => blinking pipe
" 6 => solid pipe

if &term =~ "xterm"
  " Insert
  let &t_SI  = "\<Esc>]12;gray\x7"
  let &t_SI .= "\<Esc>[4 q"
  " Normal
  let &t_EI  = "\<Esc>]12;green\x7"
  let &t_EI .= "\<Esc>[2 q"
  autocmd VimLeave * silent !echo -ne "\033]112\007"
elseif &term =~ "screen"
  " Insert
  let &t_SI  = "\<Esc>Ptmux;\<Esc>\<Esc>]12;gray\x7\<Esc>\\"
  let &t_SI .= "\<Esc>Ptmux;\<Esc>\<Esc>[4 q\<Esc>\\"
  " Normal
  let &t_EI  = "\<Esc>Ptmux;\<Esc>\<Esc>]12;blue\x7\<Esc>\\"
  let &t_EI .= "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
  autocmd VimLeave * silent !printf "\033Ptmux;\033\033]12;grey\007\033\\"
endif

" " fix cursor in TMUX
" if exists('$TMUX')
"     let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"     let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" else
"     let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"     let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" endif

" Git cmds
noremap <leader>ga :Gwrite<cr>
noremap <leader>gc :Gcommit<cr>
noremap <leader>gsh :Gpush<cr>
noremap <leader>gll :Gpull<cr>
noremap <leader>gs :Gstatus<cr>
noremap <leader>gd :Gvdiff<cr>
noremap <leader>gr :Gremove<cr>
nnoremap <leader>o :.Gbrowser<cr>
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<cr>

" set working directory
nnoremap <leader>. :lcd %:p:h<cr>


"""""""""""""""""""""""""""""""""
"""  Plugin settings            "
"""                             "
"""""""""""""""""""""""""""""""""

" snippets
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<C-b>"
" let g:UltiSnipsEditSplit="vertical"

" syntastic
let g:syntastic_always_populate_loc_list=1

" lightline status bar
let g:lightline = {
  \   'active': {
  \     'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \     'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \   },
  \ }

if has('macunix')   " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<cr>
  vmap <C-c> :w !pbcopy<cr><cr>
endif

" File tree settings
let g:netrw_banner = 0
let g:netrw_browse_split = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 18

cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack
let g:ackprg = 'ag --vimgrep --smart-case'

" denite file search (c-p uses gitignore, c-o looks at everything)
nnoremap <space><space> :DeniteProjectDir -buffer-name=git -direction=top file_rec/git<CR>
" map <C-O> :DeniteProjectDir -buffer-name=files -direction=top file_rec<CR>

" -u flag to unrestrict (see ag docs)
call denite#custom#var('file_rec', 'command',
      \ ['ag', '--follow', '--nocolor', '--nogroup', '-u', '-g', ''])

call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
      \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

" --- type ° to search the word in all files in the current dir
nmap * :Ack <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ack<space>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
vnoremap <silent> <Enter> :EasyAlign<cr>
