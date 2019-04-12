" Stack normal/visual/select Ctrl-L to clear search highlight
    nnoremap <silent> <C-L> :<C-U>nohlsearch<CR><C-L>
    vnoremap <silent> <C-L> :<C-U>nohlsearch<CR>gv<C-L>

" Cycle through argument list
    nnoremap [a :previous<CR>
    nnoremap ]a :next<CR>
" Cycle through buffers
    nnoremap [b :bprevious<CR>
    nnoremap ]b :bnext<CR>
" Cycle through quicklist/:helpgrep items
    nnoremap [c :cprevious<CR>
    nnoremap ]c :cnext<CR>
" Cycle through location list items
    nnoremap [l :lprevious<CR>
    nnoremap ]l :lnext<CR>

" Normal leader maps; use <Bslash> not <Leader> for vim-tiny

" \a toggles 'formatoptions' 'a' flag using a plugin
nnoremap <Bslash>a :<C-U>ToggleFlagLocal formatoptions a<CR>

" \b toggles copy-pasteable linebreak settings
nmap <Bslash>b <Plug>(CopyLinebreakToggle)

" \c toggles 'cursorline'; no visual mode map as it doesn't work
nnoremap <Bslash>c :<C-U>setlocal cursorline! cursorline?<CR>
" \C toggles 'cursorcolumn'; works in visual mode
nnoremap <Bslash>C :<C-U>setlocal cursorcolumn! cursorcolumn?<CR>
if exists(':xnoremap')
  xnoremap <Bslash>C :<C-U>setlocal cursorcolumn! cursorcolumn?<CR>gv
endif

" \d inserts the local date (POSIX date)
nnoremap <Bslash>d :read !date<CR>
" \D inserts the UTC date (POSIX date)
nnoremap <Bslash>D :read !date -u<CR>

" \e forces a buffer to be editable
nnoremap <Bslash>e :<C-U>setlocal modifiable noreadonly<CR>

" \f shows the current 'formatoptions' at a glance
nnoremap <Bslash>f :<C-U>setlocal formatoptions?<CR>

" \F reloads filetype plugins
nnoremap <Bslash>F :<C-U>doautocmd filetypedetect BufRead<CR>

" \g changes directory to the current file's location
nnoremap <Bslash>g :<C-U>cd %:h<CR>:pwd<CR>

" \h toggles highlighting search results
nnoremap <Bslash>h :<C-U>set hlsearch! hlsearch?<CR>

" \H shows command history
nnoremap <Bslash>H :<C-U>history :<CR>

" \i toggles showing matches as I enter my pattern
nnoremap <Bslash>i :<C-U>set incsearch! incsearch?<CR>

" \j jumps to buffers (jetpack)
nnoremap <Bslash>j :<C-U>buffers<CR>:buffer<Space>

" \k shows my marks
nnoremap <Bslash>k :<C-U>marks<CR>

" \l toggles showing tab, end-of-line, and trailing whitespace
nnoremap <Bslash>l :<C-U>setlocal list! list?<CR>
if exists(':xnoremap')
  xnoremap <Bslash>l :<C-U>setlocal list! list?<CR>gv
endif

" \m shows normal maps
nnoremap <Bslash>m :<C-U>map<CR>
" \M shows buffer-local normal maps
nnoremap <Bslash>M :<C-U>map <buffer><CR>

" \n toggles line number display
nnoremap <Bslash>n :<C-U>setlocal number! number?<CR>
if exists(':xnoremap')
  xnoremap <Bslash>n :<C-U>setlocal number! number?<CR>gv
endif
" \N toggles position display in bottom right
nnoremap <Bslash>N :<C-U>set ruler! ruler?<CR>
if exists(':xnoremap')
  xnoremap <Bslash>N :<C-U>set ruler! ruler?<CR>gv
endif

" \o opens a line below in paste mode
nmap <Bslash>o <Plug>(PasteOpenBelow)
" \O opens a line above in paste mode
nmap <Bslash>O <Plug>(PasteOpenAbove)

" \p toggles paste mode
nnoremap <Bslash>p :<C-U>set paste! paste?<CR>

" \q formats the current paragraph
nnoremap <Bslash>q gqap

" \r acts as a replacement operator
nmap <Bslash>r <Plug>(ReplaceOperator)
if exists(':xmap')
  xmap <Bslash>r <Plug>(ReplaceOperator)
endif

" \R reloads ~/.vimrc
nnoremap <Bslash>R :<C-U>source $MYVIMRC<CR>

" \s toggles spell checking
nnoremap <Bslash>s :<C-U>setlocal spell! spell?<CR>

" \t shows current filetype
nnoremap <Bslash>t :<C-U>setlocal filetype?<CR>
" \T clears filetype
nnoremap <Bslash>T :<C-U>setlocal filetype=<CR>

" \u sets US English spelling (compare \z)
nnoremap <Bslash>u :<C-U>setlocal spelllang=en_us<CR>

" \v shows all global variables
nnoremap <Bslash>v :<C-U>let g: v:<CR>
" \V shows all local variables
nnoremap <Bslash>V :<C-U>let b: t: w:<CR>

" \w toggles wrapping
nnoremap <Bslash>w :<C-U>setlocal wrap! wrap?<CR>
if exists(':xnoremap')
  xnoremap <Bslash>w :<C-U>setlocal wrap! wrap?<CR>gv
endif

" \x strips trailing whitespace via a custom plugin
nmap <Bslash>x :StripTrailingWhitespace<CR>
if exists(':xmap')
  xmap <Bslash>x :StripTrailingWhitespace<CR>
endif

" \X squeezes repeated blank lines via a custom plugin
nmap <Bslash>X :SqueezeRepeatBlanks<CR>
if exists(':xmap')
  xmap <Bslash>X :SqueezeRepeatBlanks<CR>
endif

" \y shows all registers
nnoremap <Bslash>y :<C-U>registers<CR>

" \z sets NZ English spelling (compare \u)
nnoremap <Bslash>z :<C-U>setlocal spelllang=en_nz<CR>

" \= runs the whole buffer through =, preserving position
nnoremap <Bslash>= :<C-U>call vimrc#Anchor('1G=G')<CR>
" \+ runs the whole buffer through gq, preserving position
nnoremap <Bslash>+ :<C-U>call vimrc#Anchor('1GgqG')<CR>

" \. runs the configured make program into the location list
nnoremap <Bslash>. :<C-U>lmake!<CR>

" \< and \> adjust indent of last edit; good for pasting
nnoremap <Bslash><lt> :<C-U>'[,']<lt><CR>
nnoremap <Bslash>> :<C-U>'[,']><CR>

" \_ uses last changed or yanked text as a characterwise object
onoremap <Bslash>_ :<C-U>normal! `[v`]<CR>

" \% uses entire buffer as a linewise object
onoremap <Bslash>% :<C-U>normal! 1GVG<CR>

" \{ and \} move to lines with non-space chars before current column
nmap <Bslash>{ <Plug>(VerticalRegionUpNormal)
nmap <Bslash>} <Plug>(VerticalRegionDownNormal)
omap <Bslash>{ <Plug>(VerticalRegionUpOperator)
omap <Bslash>} <Plug>(VerticalRegionDownOperator)
if exists(':xmap')
  xmap <Bslash>{ <Plug>(VerticalRegionUpVisual)
  xmap <Bslash>} <Plug>(VerticalRegionDownVisual)
endif

" \/ types :vimgrep for me ready to enter a search pattern
nnoremap <Bslash>/ :<C-U>vimgrep /\c/ **<S-Left><S-Left><Right>
" \? types :helpgrep for me ready to enter a search pattern
nnoremap <Bslash>? :<C-U>helpgrep \c<S-Left>

" \DEL deletes the current buffer
nnoremap <Bslash><Delete> :bdelete<CR>
" \INS edits a new buffer
nnoremap <Bslash><Insert> :<C-U>enew<CR>

" Execution mappings; each of these clobbers register z
"
" \@ executes line in normal mode
nnoremap <Bslash>@ ^"zyg_@z
" \: executes line in command mode
nnoremap <Bslash>: ^"zyg_:<C-R>z<CR>
" \! executes line with 'shell'
nnoremap <Bslash>! ^"zyg_:!<C-R>z<CR>

