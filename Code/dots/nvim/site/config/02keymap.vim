" _  _ ____ _   _ _  _ ____ ___
" |_/  |___  \_/  |\/| |__| |__]
" | \_ |___   |   |  | |  | |
"
" Elect a new <leader>
  " noremap <space> <nop>
  let mapleader = ' '
  map <space> <leader>
  map <space><space> <leader><leader>

  " save your pinks, commander
  nmap ; :

" fire off a quick S&R
  nnoremap :: :%s:::g<Left><Left><Left>
  nnoremap :' :%s:::cg<Left><Left><Left><Left>
" add a pattern group to your search more easily
  cmap ;\ \(\)<Left><Left>

" Edit .vimrc
  nnoremap <leader>ec :e $MYVIMRC<cr>

" Source .vimrc
  nnoremap <leader>rc :source $MYVIMRC<cr>
             \:exe 'echo ".vimrc resourced"'<cr>

" Vimplug actions
  nnoremap <leader>pi :PlugInstall<cr>
  nnoremap <leader>pc :PlugClean<cr>

" Save and quit quickly
  nnoremap <silent> <C-s> :w!<cr>
  nnoremap <silent> <C-S> :wa!<cr>
  inoremap <silent> <C-s> <esc>:w!<cr>
  nnoremap <silent> <C-q> <esc>:q<cr>

" Change directory to here
  nmap <leader>cwd :lcd %:p:h<cr>
  cmap vmp verbose map

" Really Write! - for when you forget to sudo (thx @spf13)
  cmap w!! w !sudo tee % >/dev/null

" Some buffers are in tabs. Some tabs are in buffers.
  " nmap <Tab> :tabnext<cr>
  " nmap <C-Tab> :tabclose<cr>
  " nmap <S-Tab> :tabprevious<cr>

" search for help on cursorword
  nnoremap <leader>h "hyaw:h <C-r>h<cr>

" preview file under the cursor
  xnoremap <silent> <Leader>pf y:pedit <C-r><C-r>"<cr>
  nnoremap <silent> <Leader>pf :pedit <C-r><C-f><cr>

" sets cursor word to last search
  nnoremap <silent> c<Tab> :let @/=expand('<cword>')<cr>cgn

" toggle Mundo
  nnoremap <leader>ut :MundoToggle<CR>

" EasyAlign horizontal whitespace
  vnoremap <silent> <leader>ea :EasyAlign<cr>
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
  vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)

" toggle search highlighting
  nnoremap <silent> <leader>/ :set invhlsearch<CR>
" Stack normal/visual/select Ctrl-L to clear search highlight
  nnoremap <silent> <leader>hl :<C-U>nohlsearch<CR><C-L>
  vnoremap <silent> <leader>hl :<C-U>nohlsearch<CR>gv<C-L>

" Output the current syntax group
  nnoremap <f10>
        \ :echo "hi<"
        \ . synIDattr(synID(line("."),col("."),1),"name")
        \ . "> trans<"
        \ . synIDattr(synID(line("."),col("."),0),"name")
        \ . "> lo<"
        \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
        \ . ">"<cr>

" Cursor glides between lines, wrapped or not
  noremap j gj
  noremap k gk

" Easier horizontal scroll
  map zl zL
  map zh zH

" End of the line, jump
  noremap H ^
  noremap L g_
  noremap ^ H
  noremap $ L

" make a new line above or below w/o insert mode
  nmap <BS> O<esc>
  nmap <CR> o<esc>

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

" window mgmt like Tmux panes
  " quicker window navigation
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

" easy, empty splits
  nnoremap <leader>v :vs e<CR>
  nnoremap <leader>s :sp e<CR>
  nnoremap gvf <C-w>vgf

" indent without leaving VISUAL mode
  vnoremap < <gv
  vnoremap > >gv

" repeat operator with a visual selection (!)
  " http://stackoverflow.com/a/8064607/127816
  vnoremap . :normal .<CR>

" Yank to the end of the line like C and D
  nnoremap Y y$

" duplicate line
  nmap <leader>D mzyyp`z

" selects the last changed text (often pasted)
  onoremap <expr> il ':<C-u>norm! `['.strpart(getregtype(), 0, 1).'`]<cr>'

" select and reformat the whole document
  nnoremap <leader>== ggVG=

" ___ ____ ____ _  _ _ _  _ ____ _
"  |  |___ |__/ |\/| | |\ | |__| |
"  |  |___ |  \ |  | | | \| |  | |___
"
" get out of the terminal
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

scriptencoding utf-8
