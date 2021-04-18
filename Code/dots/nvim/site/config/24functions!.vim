" tester function from @christoomey
" https://ctoomey.com/writing/an-incremental-approach-to-vim/
function! DoAThing()
    echo 'Hello World!'
endfunction

" nmap <leader>rn :source %<cr>:call DoAThing()<cr>

function! Autosave()
    exe ":au FocusLost" expand("%") ":wa"
endfunction

nnoremap <leader>aus :call Autosave()<cr>

" global find/replace inside working directory
" from https://www.sean.sh/log/finally-a-vim-global-find-replace-that-doesn-t-hurt/
function! FindReplace()
    " figure out which directory we're in
	let dir = expand('%:h')
    " ask for patterns
    call inputsave()
    let find = input('Pattern: ')
    call inputrestore()
    let replace = input('Replacement: ')
    call inputrestore()
    " are you sure?
    let confirm = input('WARNING: About to replace ' . find . ' with ' . replace . ' in ' . dir . '/**/* (y/n):')
    " clear echoed message
    :redraw
    if confirm == 'y'
        " find with rigrep (populate quickfix )
        :silent exe 'Rg ' . find
        " use cfdo to substitute on all quickfix files
        :silent exe 'cfdo %s/' . find . '/' . replace . '/g | update'
        " close quickfix window
        :silent exe 'cclose'
        :echom('Replaced ' . find . ' with ' . replace . ' in all files in ' . dir )
    else
        :echom('Find/Replace Aborted :(')
        return
    endif
endfunction

nnoremap <leader>fr :call FindReplace()<CR>
