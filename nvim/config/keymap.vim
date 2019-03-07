" _  _ ____ _   _ _  _ ____ ___
" |_/  |___  \_/  |\/| |__| |__]
" | \_ |___   |   |  | |  | |
"
" Elect a new <leader>
    let mapleader = ' '

" Get a semi, save a pinky
" https://nvie.com/posts/how-i-boosted-my-vim/
    nnoremap ; :

" Edit .vimrc
    noremap <leader>ec :e ~/.dot/vimrc.symlink<cr>

" Source .vimrc
    noremap <leader>rc :source $MYVIMRC<cr>
             \:exe 'echo ".vimrc resourced"'<cr>

" Save and quit quickly
    map <leader>w :w<cr>
    map <leader>q :q<cr>
    map <leader>wq :wq<cr>
    inoremap <C-s> <esc>:w<cr>

" Change directory to here
    cmap <leader>cd lcd %:p:h<cr>

" Really Write! - for when you forget to sudo (thx @spf13)
    cmap w!! w !sudo tee % >/dev/null

" Some buffers are in tabs. Some tabs are in buffers.
    " nmap <Tab> :tabnext<cr>
    " nmap <C-Tab> :tabclose<cr>
    " nmap <S-Tab> :tabprevious<cr>

" EasyAlign horizontal whitespace
    vnoremap <silent> <leader>ea :EasyAlign<cr>

" Focus and isolate current buffer
    nnoremap <silent> <leader>z :Goyo<cr>

" toggle search highlighting
    nmap <silent> <leader>/ :set invhlsearch<CR>

" Cursor glides between lines, wrapped or not
    noremap j gj
    noremap k gk

" Easier horizontal scroll
    map zl zL
    map zh zH

" make a new line above or below w/o insert mode
    nnoremap <BS> O<esc>
    nnoremap <Enter> o<esc>

" Metamover moves lines around with <M-h/j/k/l>
" also maps these movements to the symbols they produce (˙∆˚¬ = hjkl)
" iTerm recognizes Option as Meta key, but other $TERMs may not
    nnoremap <M-h> <<
    nnoremap <M-j> :m .+1<CR>==
    nnoremap <M-k> :m .-2<CR>==
    nnoremap <M-l> >>

    nnoremap ˙ <<
    nnoremap ∆ :m .+1<CR>==
    nnoremap ˚ :m .-2<CR>==
    nnoremap ¬ >>

    inoremap <M-h> <C-d>
    inoremap <M-j> <Esc>:m .+1<CR>==gi
    inoremap <M-k> <Esc>:m .-2<CR>==gi
    inoremap <M-l> <C-t>

    inoremap ˙ <C-d>
    inoremap ∆ <Esc>:m .+1<CR>==gi
    inoremap ˚ <Esc>:m .-2<CR>==gi
    inoremap ¬ <C-t>

    vnoremap <M-h> <gv
    vnoremap <M-j> :m '>+1<CR>gv=gv
    vnoremap <M-k> :m '<-2<CR>gv=gv
    vnoremap <M-l> >gv

    vnoremap ˙ <gv
    vnoremap ∆ :m '>+1<CR>gv=gv
    vnoremap ˚ :m '<-2<CR>gv=gv
    vnoremap ¬ >gv

" windowpane navigation
" same bindings as Tmux
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l

" indent without leaving VISUAL mode
    vnoremap < <gv
    vnoremap > >gv

" repeat operator with a visual selection (!)
    " http://stackoverflow.com/a/8064607/127816
    vnoremap . :normal .<CR>

" reclaim Wildfire!
    map \ <Plug>(wildfire-fuel)
    vnoremap <BS> <Plug>(wildwire-water)

" Yank to the end of the line like C and D
    nnoremap Y y$

" Extend substitute function with easyclip
    let g:EasyClipUseSubstituteDefaults = 1

" Preserve mark making, while using `m` to move with vim-easyclip
    nnoremap gm m

" Skip Ex Mode and format with Q
    map Q gq

" ___ ____ ____ _  _ _ _  _ ____ _
"  |  |___ |__/ |\/| | |\ | |__| |
"  |  |___ |  \ |  | | | \| |  | |___
"
tnoremap <Esc> <C-\><C-n>

" move between windows the same in any mode
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l



scriptencoding utf-8
