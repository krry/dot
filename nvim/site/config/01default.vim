" 1 important
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
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

 " 6 multiple windows
    set hidden
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
    set foldmethod=syntax
    set foldlevelstart=2

" 18 reading and writing files
    set nomodeline
    set nostartofline
    set nowritebackup
    set backup
    set backupdir=~/.local/share/nvim/backup
    set backupskip^=/dev/shm/*
    set backupskip+=node_modules/*
    set autowrite
    set autowriteall

" 19 the swap file
    set noswapfile

" 20 command line editing
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

" 25 various
    " N.B., BE FUCKING AWARE THAT set virtualedit=all GETS ALL LOOSY GOOSEY!
    set virtualedit=onemore          " one char after end
    set virtualedit=block            " in visual block mod
    let g:session_autosave = 'no'
    set sessionoptions-=localoptions " No buffer options or mappings
    set sessionoptions-=options      " No buffer options or mappings
    set shortmess+=I                 " don't show startup splash screen
    set wildmenu
    set wildmode=list:longest        " tab press completes and lists
    silent! set wildignorecase


