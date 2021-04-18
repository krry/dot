function! NavigateHelp()
    nnoremap <buffer> <CR> <C-]>
    nnoremap <buffer> <BS> <C-T>
    nnoremap <buffer> q :q
    nnoremap <buffer> o /'\l\{2,\}'<CR>
    nnoremap <buffer> O ?'\l\{2,\}'<CR>
    nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
    nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>
    setl nonumber
endfunction

augroup helpers
    autocmd!
    autocmd Filetype help :call NavigateHelp()
augroup END
