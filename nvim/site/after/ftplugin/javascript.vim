scriptencoding utf-8

setl foldcolumn=1
let javascript_fold=1
setl foldlevelstart=99
setlocal foldmethod=syntax
" help :find do its job based on the current filetype
setlocal suffixesadd+=.js

let g:javascript_conceal_function       = 'ƒ'
let g:javascript_conceal_null           = 'ø'
let g:javascript_conceal_this           = '@'
let g:javascript_conceal_return         = '⇚'
let g:javascript_conceal_undefined      = '¿'
let g:javascript_conceal_NaN            = 'ℕ'
let g:javascript_conceal_prototype      = '¶'
let g:javascript_conceal_static         = '•'
let g:javascript_conceal_super          = 'Ω'
let g:javascript_conceal_arrow_function = '⇒'

set tabstop=2
set softtabstop=2
set shiftwidth=2
