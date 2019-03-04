function! s:TightenHTML()
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
  " turns on html autocomplete
  set omnifunc=htmlcomplete#CompleteTags
endfunction

augroup htmlers
  autocmd!
  au BufEnter *.html call s:TightenHTML()
augroup END
