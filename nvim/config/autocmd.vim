
augroup helpers
    autocmd!
    " Help is on the K!
    autocmd FileType vim setlocal keywordprg=:help

    autocmd BufReadPost *           " restores cursor position
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \ exe "normal! g`\"" |
        \ endif

    " au! BufRead,BufNewFile *.m,*.oct set filetype=octave
"
    " if has('autocmd') && exists('+omnifunc')
        " autocmd Filetype octave
            " \	if &omnifunc == '' |
            " \	setlocal omnifunc=syntaxcomplete#Complete |
            " \	endif
    " endif

augroup END
