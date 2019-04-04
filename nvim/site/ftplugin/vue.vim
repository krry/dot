" let g:vue_disable_pre_processors = 1

augroup vuers
    autocmd!
    autocmd FileType vue syntax sync fromstart
augroup END
