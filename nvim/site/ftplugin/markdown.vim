" .88b  d88.  .d8b.  d8888b. db   dD d8888b.  .d88b.  db   d8b   db d8b   db
" 88'YbdP`88 d8' `8b 88  `8D 88 ,8P' 88  `8D .8P  Y8. 88   I8I   88 888o  88
" 88  88  88 88ooo88 88oobY' 88,8P   88   88 88    88 88   I8I   88 88V8o 88
" 88  88  88 88~~~88 88`8b   88`8b   88   88 88    88 Y8   I8I   88 88 V8o88
" 88  88  88 88   88 88 `88. 88 `88. 88  .8D `8b  d8' `8b d8'8b d8' 88  V888
" YP  YP  YP YP   YP 88   YD YP   YD Y8888D'  `Y88P'   `8b8' `8d8'  VP   V8P

augroup markdowners
    autocmd!
    autocmd BufRead,BufNewFile *.{md,markdown,txt} setf markdown

    " code blocks for markdown
    inoremap <buffer><silent> ~~~ ~~~<Enter>~~~<C-o>k<C-o>A
    inoremap <buffer><silent> ``` ```<Enter>```<C-o>k<C-o>A

    nnoremap <buffer> <M-m> :MarkdownPreview<CR>

    setlocal textwidth=78
    setlocal formatoptions+=t
    setlocal wrapmargin=2
    setlocal nolist
    setlocal conceallevel=0

augroup END

" disable folding by default
let b:vim_markdown_folding_disabled = 1
" what gets highlit within fences
let g:vim_markdown_fenced_languages = ['html', 'python', 'bash=sh', 'rust', 'go', 'js', 'css']
" enable strikethrough
let g:vim_markdown_strikethrough = 1
" disable markdown conceallevel setting
let g:vim_markdown_conceal = 0
" prevent code blocks from mis-highlighting
let g:markdown_minlines = 100
" disable math conceal with LaTeX enabled
let g:tex_conceal = ''
let g:vim_markdown_math = 1
