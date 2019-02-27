" .88b  d88.  .d8b.  d8888b. db   dD d8888b.  .d88b.  db   d8b   db d8b   db
" 88'YbdP`88 d8' `8b 88  `8D 88 ,8P' 88  `8D .8P  Y8. 88   I8I   88 888o  88
" 88  88  88 88ooo88 88oobY' 88,8P   88   88 88    88 88   I8I   88 88V8o 88
" 88  88  88 88~~~88 88`8b   88`8b   88   88 88    88 Y8   I8I   88 88 V8o88
" 88  88  88 88   88 88 `88. 88 `88. 88  .8D `8b  d8' `8b d8'8b d8' 88  V888
" YP  YP  YP YP   YP 88   YD YP   YD Y8888D'  `Y88P'   `8b8' `8d8'  VP   V8P

function! s:wrapGood()
  setl wrap
  setl wm=2
  setl textwidth=78
  setl nolist
  set conceallevel=0
endfunction

augroup FileType markdown
  call s:wrapGood()
  " code blocks for markdown
  inoremap <buffer><silent> ~~~ ~~~<Enter>~~~<C-o>k<C-o>A
  inoremap <buffer><silent> ``` ```<Enter>```<C-o>k<C-o>A
augroup END

let g:vim_markdown_conceal = 0 " disable markdown conceallevel setting
let g:tex_conceal = ""         " disable math conceal with LaTeX enabled
let g:vim_markdown_math = 1
