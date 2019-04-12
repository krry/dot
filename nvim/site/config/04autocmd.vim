augroup helpers
    autocmd!
    " Help is on the K!
    autocmd FileType vim setlocal keywordprg=:help
augroup END

" close if final buffer is netrw or the quickfix
augroup finalcountdown
    autocmd!
    "autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), '&filetype') == 'netrw' || &buftype == 'quickfix' |q|endif
    autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) || &buftype == 'quickfix' | q | endif
    "nmap - :Lexplore<cr>
    nmap - :NERDTreeToggle<cr>
augroup END

function! s:TightenDents()
  setl tabstop=2
  setl shiftwidth=2
  setl softtabstop=2
endfunction

augroup tightones
    autocmd!
    autocmd FileType {css,html,vue,javascript.jsx,json} call s:TightenDents()
augroup END
