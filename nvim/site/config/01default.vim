" 1 important
set runtimepath^=~/.vim rtp+=~/.vim/after rtp+=/usr/local/opt/fzf
let &packpath = &runtimepath
set path-=/usr/include  " let C filetype add this
set path+=**    " search current directory's whole tree

" 2 moving around, searching and patterns
set whichwrap=b,s,<,>,h,l,[,]
set incsearch
set hlsearch
set ignorecase
set smartcase

" N.B., DON'T FUCK WITH TAGLENGTH UNLESS YOU KNOW WHAT IT DOES

" 4 displaying text
set scrolloff=3
set linebreak
set showbreak=...           " prefix wrapped rows with three dots
set list
set timeoutlen=3000         " more patience to complete mappings

" 5 syntax, highlighting and spelling
filetype plugin indent on
syntax enable
set cursorline
set cursorcolumn
set signcolumn=yes          " CoC requested nvim/site/plugin/coc.vim

" 6 multiple windows
set hidden                  " CoC wants this
set splitbelow
set splitright

" 8 terminal
set scrolljump=5
set titlelen=80

" 9 using the mouse
set mouse=a
silent! set ttymouse=

" 11 messages and info
set confirm
set include=  " let C/C++ filetype handle this

" 12 selecting text
set selection=inclusive
set clipboard=unnamed,unnamedplus

" 13 editing text
set undolevels=1000
set undofile
set undodir=~/.local/share/nvim/undo
set backspace=indent,eol,start
set complete=.,w,b,u,t
set completeopt=menu,preview
set pumheight=10
"set digraph
set showmatch
set nojoinspaces
set textwidth=78
set wrapmargin=0
set formatoptions-=o
set formatoptions+=j  " delete comment leaders when joining lines

" 14 tabs and indenting
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set cindent
set preserveindent
silent! set breakindent

" 15 folding
set foldopen=all
set foldclose=all
set foldlevelstart=2
set foldmethod=manual

" 18 reading and writing files
set nomodeline
set nostartofline
set nowritebackup
set nobackup
set backupdir=~/.local/share/nvim/backup
set backupskip^=/dev/shm/*
set backupskip+=node_modules/*
set autoread                " watch for changes to files in buffers
set autowrite               " preserve all changes on buffer switch
set autowriteall            " also autosaves on edit, quit, etc.

" 19 the swap file
set noswapfile
set updatetime=300          " COC wants this

" 20 command line editing
set cmdheight=1             " COC wants this
set history=10000

" 21 executing external commands
if &shell =~# 'fish$'
  set shell=bash               " VIm doesn't like fish.
endif

" 22 running make and jumping to errors
set grepprg=rg\ --vimgrep
set grepformat^=%f:%l:%c:%m

" 24 multi-byte characters
scriptencoding utf-8
set emoji
set guifont=Hack\ Nerd\ Font:h12

" 25 various
" N.B., BE FUCKING AWARE THAT `set virtualedit=all` GETS ALL LOOSY GOOSEY!
set virtualedit=onemore          " one char after end
set virtualedit=block            " in visual block mod
let g:session_autosave = 'no'
set sessionoptions-=localoptions " No buffer options or mappings
set sessionoptions-=options      " No buffer options or mappings
set shortmess+=Ic                 " don't show startup splash screen
set wildmenu
set wildmode=list:longest        " tab press completes and lists
silent! set wildignorecase       " exclude silliness from searches
set wildignore+=.git,.svn,.DS_Store,.npm,.vagrant,*.zip,*.tgz,*.pdf,*.psd,*.ai,*.mp3,*.mp4,*.bmp,*.ico,*.jpg,*.png,*.gif,*.epub,.hg,.dropbox,.config,.cache,*.pyc,node_modules/*,bower_components/*,*.min.*

