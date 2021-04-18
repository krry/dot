"
"    ee   e e  eeeeeee eeeee e     e   e eeeee
"    88   8 8  8  8  8 8   8 8     8   8 8   8
"    88  e8 8e 8e 8  8 8eee8 8e    8e  8 8e
"     8  8  88 88 8  8 88    88    88  8 88 "8
"     8ee8  88 88 8  8 88    88eee 88ee8 88ee8
"
"    https://github.com/junegunn/vim-plug

"    ⚚ krry
if (exists('g:vscode'))
else

" Automatic Installation
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Setup
scriptencoding utf-8                      " smart first line for vimscript files
filetype off                              " must precede vimplug
call plug#begin('~/.local/share/nvim/bundles')

" Navigation
Plug 'Shougo/denite.nvim'                 " unite all the tools
Plug 'jremmen/vim-ripgrep'                " fuzzy search for anything
Plug 'scrooloose/nerdtree'                " filesystem navigation
Plug 'yegappan/mru'                       " Most Recently Used files viewer
Plug 'Shougo/neomru.vim'                  " makes mru denite-compatible
Plug 'Shougo/neoyank.vim'                 " saves yank history then filters
Plug 'mhinz/vim-startify'                 " start screen

" Completion / Lint / Syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " conquer of completion
Plug 'sheerun/vim-polyglot'               " on-demand language packs
Plug 'Shougo/neosnippet'                  " an aging snippet completor
Plug 'Shougo/neosnippet-snippets'         " supporting snippet library
Plug 'hail2u/vim-css3-syntax'             " moar css support
Plug 'neoclide/jsonc.vim'                 " jsonc syntax support
Plug 'tpope/vim-liquid'                   " liquid template support
Plug 'neoclide/vim-jsx-improve'           " ECMA to the rescue
Plug 'peitalin/vim-jsx-typescript'        " support for jsx and react
Plug 'leafgarland/typescript-vim'         " tsx highlighting
Plug 'jparise/vim-graphql'                " graphql support
Plug 'styled-components/vim-styled-components', {'branch': 'main'} " css-in-js

" Git / Versioning
Plug 'tpope/vim-fugitive'                 " git slicker
Plug 'tpope/vim-rhubarb'                  " hub to fugitive's git
Plug 'airblade/vim-gitgutter'             " mark lines with changes
Plug 'Xuyuanp/nerdtree-git-plugin'        " NERDtree shows git statuses
Plug 'simnalamburt/vim-mundo'             " undotree worldwide

" Magic tricks
Plug 'raghur/fruzzy', {'do': { -> fruzzy#install()}}  " crazy fast matcher
Plug 'gcmt/wildfire.vim'                  " growing text object selection
Plug 'easymotion/vim-easymotion'          " show motions in realtime
Plug 'justinmk/vim-sneak'                 " two letter leaps around the text
Plug 'AndrewRadev/switch.vim'             " flip bits like plumpjacks
Plug 'tpope/vim-repeat'                   " ( for {surrounding} 'text' )
Plug 'terryma/vim-multiple-cursors'       " Sublime multi-cursor action
Plug 'tpope/vim-surround'                 " ( for {surrounding} 'text' )

" Comments and Docs
Plug 'vimwiki/vimwiki', {'branch': 'dev'} " linkable, publishable notes
Plug 'tpope/vim-commentary'               " simpler commenting
Plug 'suy/vim-context-commentstring'      " smart comments in multilingual files

" Hygiene
Plug 'reedes/vim-wordy'                   " highlight bad word usage
Plug 'bronson/vim-trailing-whitespace'    " FixWhitespace, highlight it red

" Colors
Plug 'morhetz/gruvbox'                    " med-con retro groovy colorscheme
Plug 'NLKNguyen/papercolor-theme'         " inspired by material design
Plug 'rafi/awesome-vim-colorschemes/'     " collection of great schemes
Plug 'amadeus/vim-convert-color-to'       " switch between rgb, hex, hsl
Plug 'artanikin/vim-synthwave84'          " because the 80s


" Terminal
Plug 'justinmk/vim-gtfo'                  " got or gof :: terminal or finder
Plug 'christoomey/vim-tmux-navigator'     " move seamlessly from vim to tmux

" Alignment
Plug 'junegunn/vim-easy-align'            " easy vertical alignments
Plug 'nathanaelkane/vim-indent-guides'    " nice-lookin indent signifiers

" Tags / Tagging
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'                  " puts ctags in a rightside bar

" Templating
Plug 'mattn/emmet-vim'                    " HTML/CSS hackery
Plug 'heracek/HTML-AutoCloseTag'          " Never close a tag again

" Markdown
Plug 'godlygeek/tabular'                  " table-maker for markdown
Plug 'euclio/vim-markdown-composer'       " preview markdown en el browsero

" Typography
Plug 'fadein/vim-FIGlet'                  " for headers
Plug 'chrisbra/unicode.vim'               " discover Unicode, digraphs, etc.
Plug 'tpope/vim-characterize'             " identify Unicode, digraphs, etc.
Plug 'ryanoasis/vim-devicons'             " icons for dev stuff

call plug#end()                           " leaving Vimplugville
endif
