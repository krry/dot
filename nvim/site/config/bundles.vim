"
"    ee   e e  eeeeeee eeeee e     e   e eeeee
"    88   8 8  8  8  8 8   8 8     8   8 8   8
"    88  e8 8e 8e 8  8 8eee8 8e    8e  8 8e
"     8  8  88 88 8  8 88    88    88  8 88 "8
"     8ee8  88 88 8  8 88    88eee 88ee8 88ee8
"
"    https://github.com/junegunn/vim-plug

"    🧞 krry

" Setup
    scriptencoding utf-8
    set background=dark                   " for colorschemes
    filetype off                          " must precede vimplug
    call plug#begin('~/.local/share/nvim/bundles') " let's get ready to BUNDLE!

" Git / Versioning
    Plug 'tpope/vim-fugitive'          " git slicker
    Plug 'tpope/vim-rhubarb'           " hub to fugitive's git
    Plug 'airblade/vim-gitgutter'      " mark lines with changes
    Plug 'Xuyuanp/nerdtree-git-plugin' " NERDtree shows git statuses
    Plug 'simnalamburt/vim-mundo'      " undotree worldwide

" File / Project Navigation
    Plug 'Shougo/denite.nvim'          " fuzzy search for anything
    Plug 'scrooloose/nerdtree'         " filesystem navigation
    Plug 'vim-scripts/mru.vim'         " Most Recently Used files viewer
    Plug 'mhinz/vim-startify'          " start screen
    Plug 'justinmk/vim-gtfo'           " got or gof :: terminal or finder
    Plug 'justinmk/vim-sneak'          " two letter leaps around the text
    Plug 'xolox/vim-misc'              " supports easyclip and vim-session
    Plug 'vimwiki/vimwiki', {'branch': 'dev'} " linkable, publishable notes

" Language / syntax
    Plug 'w0rp/ale'                      " asynchronous lint engine
    Plug 'sheerun/vim-polyglot'          " on-demand language packs
    Plug 'godlygeek/tabular'             " table-maker for markdown
    Plug 'plasticboy/vim-markdown'       " Improved markdown support
    Plug 'iamcco/markdown-preview.nvim'  " preview markdown en el browsero
    Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'} " Go tools
    Plug 'rust-lang/rust.vim'            " Syntastic, Tagbar, rustfmt integration
    Plug 'digitaltoad/vim-pug'           " pug nee jade support
    Plug 'neoclide/coc.nvim', { 'tag': '*', 'do': { -> coc#util#install()} }
    Plug 'mattn/emmet-vim'                " HTML/CSS hackery
    Plug 'heracek/HTML-AutoCloseTag'      " Never close a tag again
    Plug 'mustache/vim-mustache-handlebars' " hairy thin mouth lip
    Plug 'tranvansang/octave.vim'         " octave syntax/indent support

" Magic tricks
    Plug 'tpope/vim-repeat'               " ( for {surrounding} 'text' )
    Plug 'tpope/vim-surround'             " ( for {surrounding} 'text' )
    Plug 'easymotion/vim-easymotion'      " show motions in realtime
    Plug 'tpope/vim-commentary'           " simpler commenting
    Plug 'gcmt/wildfire.vim'              " growing text object selection
    Plug 'terryma/vim-multiple-cursors'   " Sublime multi-cursor action
    Plug 'christoomey/vim-tmux-navigator' " move seamlessly from vim to tmux

" Hygiene
    Plug 'bronson/vim-trailing-whitespace' " FixWhitespace, highlight it red
    Plug 'valloric/MatchTagAlways'         " highlight matching close tag
    Plug 'reedes/vim-wordy'                " highlight bad word usage

" Cosmetics
    Plug 'tomasr/molokai'                  " high-contrast theme
    Plug 'romainl/Apprentice'              " low-contrast theme
    Plug 'NLKNguyen/papercolor-theme'      " inspired by material design
    Plug 'fadein/vim-FIGlet'               " for headers
    Plug 'junegunn/vim-easy-align'         " easy vertical alignments
    Plug 'junegunn/goyo.vim'               " distraction-free writing in vim
    Plug 'curiousleo/vim-zenroom2'         " iA Writer-like; deps on Goyo
    Plug 'nathanaelkane/vim-indent-guides' " nice-lookin indent signifiers

" Tags / Tagging
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'majutsushi/tagbar'          " puts ctags in a rightside bar

call plug#end()                       " leaving Vimplugville
