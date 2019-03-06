
" ____ ___  ___ _ ____ _  _ ____
" |  | |__]  |  | |  | |\ | [__
" |__| |     |  | |__| | \| ___]
"

" tools
    function! SourceIfExists(file)
        " Source only if file exists
        if filereadable(expand(a:file))
            exe 'source' a:file
        endif
    endfunction

    function! SourceDirectory(file)
        " Source all .vim files in directory
        for s:fpath in split(globpath(a:file, '*.vim'), '\n')
            exe 'source' s:fpath
        endfor
    endfunction

" plugins
    call SourceIfExists('~/.local/share/nvim/config/bundles.vim') " Load ALL THE PLUGINS!!!
"
" 1 important
    " set nocompatible
    set noinsertmode
    set nopaste
    " set pastetoggle=<leader>paste
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath

 " 2 moving around, searching and patterns
    set whichwrap=b,s,<,>,h,l,[,]
    set startofline
    set path=.,/usr/include,,
    set cdpath=,,
    set autochdir
    set wrapscan
    set incsearch
    set hlsearch
    set magic
    " set regexpengine=0
    set ignorecase
    set smartcase
    set include=^\\s*#\\s*include
    " set includeexpr=

 " 3 tags
    set taglength=3
    set tagbsearch
    " set tags=~/.ctags
    set tagcase=followic
    set showfulltag
    " set cscopeprg
    " set cscopetag

 " 4 displaying text
    set scroll=10
    set scrolloff=3
    set wrap
    set linebreak
    set nobreakindent
    set display=lastline,msgsep
    set cmdheight=1
    set lazyredraw
    set list
    set number
    set conceallevel=2

 " 5 syntax, highlighting and spelling
    set background=dark
    filetype plugin indent on
    syntax enable
    set notermguicolors
    " set hl=
    " \ 8:specialkey,~:endofbuffer,z:termcursor,z:termcursornc,@:nontext,
    " \ d:directory,e:errormsg,i:incsearch,l:search,m:moremsg,m:modemsg,
    " \ n:linenr,n:cursorlinenr,r:question,s:statusline,s:statuslinenc,
    " \ c:vertsplit,t:title,v:visual,v:visualnos,w:warningmsg,w:wildmenu,
    " \ f:folded,f:foldcolumn,a:diffadd,c:diffchange,d:diffdelete,
    " \ t:difftext,>:signcolumn,-:conceal,b:spellbad,p:spellcap,
    " \ r:spellrare,l:spelllocal,+:pmenu,=:pmenusel,x:pmenusbar,
    " \ x:pmenuthumb,*:tabline,#:tablinesel,_:tablinefill,!:cursorcolumn,
    " \ .:cursorline,o:colorcolumn,q:quickfixline,0:whitespace,i:normalnc
    set cursorline
    set cursorcolumn
    set colorcolumn=80
    highlight colorcolumn ctermbg=8
    set nospell

 " 6 multiple windows
    set laststatus=2
    " set statusline=%{lightline}
    set equalalways
    set eadirection=both
    set winminheight=0
    " set previewwindow
    set previewheight=12
    set hidden
    set switchbuf=useopen,split
    set splitbelow
    set splitright
    set scrollopt=ver,jump
    set nocursorbind
    set noscrollbind

 " 7 multiple tab pages
    set showtabline=1
    set tabline=%!lightline#tabline()

 " 8 terminal
    set scrolljump=5
    set title
    set titlelen=80
    " set titlestring
    " set titleold=

 " 9 using the mouse
    set mouse=a
    set mousemodel=popup_setpos

" 10 printing

" 11 messages and info
    set noterse
    " set shortmess=filnxtToOFI
    set showcmd
    set noshowmode
    set ruler
    " set rulerformat
    set verbose=0
    set report=2
    " set verbosefile=~/.local/share/nvim/log/editor.log
    set confirm
    set noerrorbells
    set visualbell

" 12 selecting text
    set selection=inclusive
    " set selectmode=mouse
    set clipboard=unnamed,unnamedplus

" 13 editing text
    set undolevels=1000
    set undofile
    set undodir=~/.local/share/nvim/undo
    set backspace=indent,eol,start
    set complete=.,w,b,u,t
    set completeopt=menu,preview
    set pumheight=10
    "set dictionary=
    "set thesaurus=
    "set digraph
    set showmatch
    set nojoinspaces
    set textwidth=78
    set wrapmargin=0
    set formatoptions-=o

" 14 tabs and indenting
    set tabstop=4
    set shiftwidth=4
    set smarttab
    set softtabstop=4
    set expandtab
    set autoindent
    set cindent
    set smartindent
    " set indentkeys=  " other than tab
    set preserveindent

" 15 folding
    set foldopen=all
    set foldclose=all
    set foldminlines=1
    set foldmethod=indent
    set foldignore=#
    set foldlevelstart=1
    set foldmarker={{{,}}}
    set foldtext=foldtext()

" 16 diff mode
    set diffopt=internal,filler

" 17 mapping
    set remap
    set timeout
    set timeoutlen=1000

" 18 reading and writing files
    set nomodeline
    set modelines=2
    set endofline
    set fixendofline
    set nobomb
    set fileformat=unix
    set fileformats=unix,dos,mac
    set write
    set nowritebackup
    set nobackup
    set autowrite
    set autowriteall
    set autoread

" 19 the swap file
    set noswapfile

" 20 command line editing
    set history=10000
    set wildmode=full
    set wildchar=9
    set wildcharm=0
    set wildmenu
    set cedit=
    set cmdwinheight=7

" 21 executing external commands
    " set noshelltemp
    " set shellredir=>%s\ 2>&1
    " set keywordprg=:Man
    " set formatprg=
    if &shell =~# 'fish$'
        set shell=bash               " VIm doesn't like fish.
    endif

" 22 running make and jumping to errors
    set grepprg=rg\ $*\ /dev/null
    " set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m

" 23 language specific

" 24 multi-byte characters
    set encoding=utf-8
    scriptencoding utf-8
    " set fileencodings=utf-8,default,latin1
    " setl fileencoding=utf-8
    " se ambiwidth=double
    set emoji

" 25 various
    set virtualedit=all
    " set eventignore=BufRead
    " set exrc      " look for external rc file in this directory
    " set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize
    let g:session_autosave = 'no'
    " set viewoptions=folds,options,cursor,curdir
    " set viewdir=~/.local/share/nvim/view
    " setl buftype=     e.g., help,nofile,"",nowrite, quickfix
    " set debug=msg
    " set signcolumn=auto
    highlight clear signcolumn
    " set pyxversion=3

" custom config
call SourceDirectory('~/.local/share/nvim/config')

" plugin settings
call SourceDirectory('~/.local/share/nvim/site/plugins') " plugin options

" 50 colorscheme
    colorscheme PaperColor
    " overriding styles
    highlight linenr ctermbg=none ctermfg=darkgray
    highlight errormsg ctermbg=red ctermfg=white cterm=bold
    highlight Folded cterm=bold ctermfg=black ctermbg=240

