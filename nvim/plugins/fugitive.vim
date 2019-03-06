
" ____ _  _ ____ _ ___ _ _  _ ____
" |___ |  | | __ |  |  | |  | |___
" |    |__| |__] |  |  |  \/  |___

    " Fugitive adds a git layer to vim
    if isdirectory(expand('~/.vim/bundle/vim-fugitive/'))
        nnoremap <silent> <leader>ga :Gwrite<cr>
        nnoremap <silent> <leader>gco :Gread<cr>
        nnoremap <silent> <leader>gc :Gcommit<cr>
        nnoremap <silent> <leader>gp :Gpush<cr>
        nnoremap <silent> <leader>gl :Gpull<cr>
        nnoremap <silent> <leader>gs :Gstatus<cr>
        nnoremap <silent> <leader>gd :Gvdiff<cr>
        nnoremap <silent> <leader>grm :Gremove<cr>
        nnoremap <silent> <leader>gmv :Gmove<cr>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>glog :Glog<CR>
        nnoremap <silent> <leader>ge :Gedit<CR>
        nnoremap <silent> <leader>gi :Git add -p %<CR>
        nnoremap <silent> <leader>gg :SignifyToggle<CR>
    endif
