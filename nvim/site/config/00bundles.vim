"
"    ee   e e  eeeeeee eeeee e     e   e eeeee
"    88   8 8  8  8  8 8   8 8     8   8 8   8
"    88  e8 8e 8e 8  8 8eee8 8e    8e  8 8e
"     8  8  88 88 8  8 88    88    88  8 88 "8
"     8ee8  88 88 8  8 88    88eee 88ee8 88ee8
"
"    https://github.com/junegunn/vim-plug

"    ⚚ krry

" Setup
    scriptencoding utf-8
    filetype off                              " must precede vimplug
    call plug#begin('~/.local/share/nvim/bundles') " let's get ready to BUNDLE!

" Navigation
    Plug 'Shougo/denite.nvim'            " unite all the tools
    Plug 'jremmen/vim-ripgrep'           " fuzzy search for anything
    Plug 'scrooloose/nerdtree'           " filesystem navigation
    Plug 'yegappan/mru'                  " Most Recently Used files viewer
    Plug 'Shougo/neomru.vim'             " makes mru denite-compatible
    Plug 'Shougo/neoyank.vim'            " saves yank history then filters
    Plug 'mhinz/vim-startify'            " start screen

" Completion / Lint / Syntax
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " conquer of completion
    Plug 'w0rp/ale'                      " asynchronous lint engine
    Plug 'sheerun/vim-polyglot'          " on-demand language packs
    Plug 'tpope/vim-liquid'              " liquid template support
    Plug 'Shougo/neosnippet'             " an aging snippet completor
    Plug 'Shougo/neosnippet-snippets'    " supporting snippet library

" Git / Versioning
    Plug 'tpope/vim-fugitive'            " git slicker
    Plug 'tpope/vim-rhubarb'             " hub to fugitive's git
    Plug 'airblade/vim-gitgutter'        " mark lines with changes
    Plug 'Xuyuanp/nerdtree-git-plugin'   " NERDtree shows git statuses
    Plug 'simnalamburt/vim-mundo'        " undotree worldwide

" Magic
    Plug 'gcmt/wildfire.vim'             " growing text object selection
    Plug 'easymotion/vim-easymotion'     " show motions in realtime
    Plug 'justinmk/vim-sneak'            " two letter leaps around the text
    Plug 'AndrewRadev/switch.vim'        " flip bits like plumpjacks
    Plug 'raghur/fruzzy', {'do': { -> fruzzy#install()}}  " crazy fast matcher

" Documentation
    Plug 'vimwiki/vimwiki', {'branch': 'dev'} " linkable, publishable notes

" Surroundings
    Plug 'tpope/vim-surround'             " ( for {surrounding} 'text' )
    Plug 'Raimondi/delimitMate'           " auto-closes surrounders

" Comments
    Plug 'tpope/vim-commentary'           " simpler commenting
    Plug 'suy/vim-context-commentstring'  " smart comments in multilingual files

" Magic tricks
    Plug 'tpope/vim-repeat'               " ( for {surrounding} 'text' )
    Plug 'terryma/vim-multiple-cursors'   " Sublime multi-cursor action

" Hygiene
    Plug 'reedes/vim-wordy'                " highlight bad word usage
    Plug 'bronson/vim-trailing-whitespace' " FixWhitespace, highlight it red
    " Plug 'valloric/MatchTagAlways'         " highlight matching close tag

" Colorschemes
    Plug 'morhetz/gruvbox'                " med-con retro groovy colorscheme
    Plug 'NLKNguyen/papercolor-theme'     " inspired by material design

" Terminal
    Plug 'justinmk/vim-gtfo'                " got or gof :: terminal or finder
    Plug 'christoomey/vim-tmux-navigator'   " move seamlessly from vim to tmux

" Alignment
    Plug 'junegunn/vim-easy-align'         " easy vertical alignments
    Plug 'nathanaelkane/vim-indent-guides' " nice-lookin indent signifiers

" Tags / Tagging
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'majutsushi/tagbar'               " puts ctags in a rightside bar

" Templating
    Plug 'mattn/emmet-vim'                  " HTML/CSS hackery
    Plug 'heracek/HTML-AutoCloseTag'        " Never close a tag again

" Markdown
    Plug 'godlygeek/tabular'                " table-maker for markdown
    Plug 'euclio/vim-markdown-composer'     " preview markdown en el browsero

" ML
    Plug 'tranvansang/octave.vim'         " octave syntax/indent support

" Typography
    Plug 'fadein/vim-FIGlet'               " for headers
    Plug 'chrisbra/unicode.vim'            " discover Unicode, digraphs, etc.
    Plug 'tpope/vim-characterize'          " identify Unicode, digraphs, etc.
    Plug 'ryanoasis/vim-devicons'           " icons for dev stuff

call plug#end()                            " leaving Vimplugville
