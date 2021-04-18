
" ____ _  _ ____ _ ___ _ _  _ ____
" |___ |  | | __ |  |  | |  | |___
" |    |__| |__] |  |  |  \/  |___

try

" Fugitive adds a git layer to vim
nnoremap <silent> <leader>fgv :vert :Git<cr>
nnoremap <silent> <leader>fgh :Git<cr>
nnoremap <silent> <leader>fga :Gwrite<cr>
nnoremap <silent> <leader>fgf :Git fetch<cr>
nnoremap <silent> <leader>fgo :Gread<cr>
nnoremap <silent> <leader>fgc :G commit<cr>
nnoremap <silent> <leader>fgp :Git push<cr>
nnoremap <silent> <leader>fgl :G pull<cr>
nnoremap <silent> <leader>fgd :Gvdiffsplit<cr>
nnoremap <silent> <leader>fgrm :GDelete<cr>
nnoremap <silent> <leader>fgrn :GRename<cr>
nnoremap <silent> <leader>fgmv :GMove<cr>
nnoremap <silent> <leader>fgb :Git blame<CR>
nnoremap <silent> <leader>fglog :Glog<CR>
nnoremap <silent> <leader>fge :Gedit<CR>
nnoremap <silent> <leader>fgi :Git add -p %<CR>

catch
    echo 'fugitive on the loose'
endtry
