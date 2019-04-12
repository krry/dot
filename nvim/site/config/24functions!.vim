" enhance the built-in increment function
" function! Increment() abort
"     call search('\d\@<!\d\+\%#\d', 'b')
"     call search('\d', 'c')
"     norm! v
"     call search('\d\+', 'ce')
"     exe 'norm!' '\<C-a>'
"     return ''
" endfun
"
" nnoremap <silent> <C-a> @=Increment()<cr>

function! Autosave()
    exe ":au FocusLost" expand("%") ":wa"
endfunction

nnoremap <leader>aus :call Autosave()<cr>
