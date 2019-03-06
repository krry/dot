
" Help is on the K! It's a... man.
augroup helpers
    autocmd!
    autocmd FileType vim setlocal keywordprg=:help

    autocmd BufReadPost *           " restores cursor position
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \ exe "normal! g`\"" |
        \ endif

augroup END
