set relativenumber
set number

function! s:isNTOpen()
    return exists('t:NERDTreeBufName') && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * if !s:isNTOpen() | set relativenumber | endif
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
