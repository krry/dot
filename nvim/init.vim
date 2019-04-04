scriptencoding utf-8
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

" Load ALL THE PLUGINS!!!
    call SourceIfExists('~/.local/share/nvim/site/config/bundles.vim')
    " in the proper order to overwrite with more specific settings
    call SourceIfExists('~/.local/share/nvim/site/config/default.vim')
    call SourceIfExists('~/.local/share/nvim/site/config/keymap.vim')
    call SourceIfExists('~/.local/share/nvim/site/config/autocmd.vim')
    call SourceIfExists('~/.local/share/nvim/site/config/abbrev.vim')
    call SourceIfExists('~/.local/share/nvim/site/config/number.vim')
    call SourceIfExists('~/.local/share/nvim/site/config/statusline.vim')
    call SourceDirectory('~/.local/share/nvim/site/plugins')
    " these get found automagically
    call SourceDirectory('~/.local/share/nvim/site/ftplugin')
    call SourceIfExists('~/.local/share/nvim/site/config/color.vim')
