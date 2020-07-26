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
    autocmd FileType {css,scss,html,vue,pug,js,javascript.jsx,json} call s:TightenDents()
    autocmd FileType markdown vmap <space><Bslash> :EasyAlign*<Bar><Enter>
augroup END

augroup reloader
  autocmd!
  autocmd FocusGained * checktime
augroup END

" set filetypes as typescript.tsx
augroup sxers
  autocmd!
  autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
augroup END

augroup jsoncers
  autocmd!
  " tsconfig.json is actually jsonc, help TypeScript set the correct filetype
  autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
augroup END

augroup gqlers
  autocmd!
  au BufNewFile,BufRead *.prisma setfiletype graphql
augroup END
