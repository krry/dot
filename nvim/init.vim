
" _ _  _ _ ___
" | |\ | |  |
" | | \| |  |
"
" when in doubt, refer to @romainl's idiomatic vimrc
" https://gist.github.com/romainl/9ecd7b09a693816997ba
" Utilities

function! SourceIfExists(file)
    " Source only if file exists
    if filereadable(expand(a:file))
        exe 'source' a:file
    endif
endfunction

function! SourceDirectory(file)
    " Source all .vim files in directory
    for s:fpath in split(globpath(a:file, '*.vim'), '\n')
        exe 'source' s:fpath
    endfor
endfunction

call SourceDirectory('~/.local/share/nvim/site/config')
call SourceDirectory('~/.local/share/nvim/site/plugins')
call SourceDirectory('~/.local/share/nvim/site/after/config')
call SourceDirectory('~/.local/share/nvim/site/after/ftplugin')
