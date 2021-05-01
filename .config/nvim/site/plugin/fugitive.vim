
" ____ _  _ ____ _ ___ _ _  _ ____
" |___ |  | | __ |  |  | |  | |___
" |    |__| |__] |  |  |  \/  |___

try

" Fugitive adds a git layer to vim
nnoremap <silent> <leader>gv :vert :Git<cr>
nnoremap <silent> <leader>gh :Git<cr>
nnoremap <silent> <leader>ga :Gwrite<cr>
nnoremap <silent> <leader>gf :Git fetch<cr>
nnoremap <silent> <leader>go :Gread<cr>
nnoremap <silent> <leader>gc :G commit<cr>
nnoremap <silent> <leader>gp :Git push<cr>
nnoremap <silent> <leader>gl :G pull<cr>
nnoremap <silent> <leader>gd :Gvdiffsplit<cr>
nnoremap <silent> <leader>grm :GDelete<cr>
nnoremap <silent> <leader>grn :GRename<cr>
nnoremap <silent> <leader>gmv :GMove<cr>
nnoremap <silent> <leader>gb :Git blame<CR>
nnoremap <silent> <leader>glog :Glog<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
nnoremap <silent> <leader>gi :Git add -p %<CR>

catch
    echo 'fugitive on the loose'
endtry
