" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" open terminal on space+n
function! OpenTerminal()
  split term://fish
  resize 10
endfunction

" open terminal on space+t
function! OpenTerminalTab()
  tabnew term://fish
endfunction

nnoremap <leader>nt :call OpenTerminalTab()<CR>
nnoremap <leader>ns :call OpenTerminal()<CR>

" use opt+hjkl to move between split/vsplit panels
tnoremap <M-h> <C-\><C-n><C-w>h
tnoremap <M-j> <C-\><C-n><C-w>j
tnoremap <M-k> <C-\><C-n><C-w>k
tnoremap <M-l> <C-\><C-n><C-w>l
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

augroup term_settings
    autocmd!
    " Do not use number and relative number for terminal inside nvim
    autocmd TermOpen * setlocal norelativenumber nonumber
    " Go to insert mode by default to start typing command
    autocmd TermOpen * startinsert
augroup END
