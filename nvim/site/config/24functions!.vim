" tester function from @christoomey
" https://ctoomey.com/writing/an-incremental-approach-to-vim/
function! DoAThing()
    echo 'Hello World!'
endfunction

nmap <leader>rn :source %<cr>:call DoAThing()<cr>

function! Autosave()
    exe ":au FocusLost" expand("%") ":wa"
endfunction

nnoremap <leader>aus :call Autosave()<cr>
