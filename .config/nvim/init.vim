

" _ _  _ _ ___
" | |\ | |  |
" | | \| |  |
"
" Neovim starts here on boot
"
" 1. utilities to source our vimrc files

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

if (exists('g:vscode'))
	echo 'found vscode'
elseif (!exists('g:vscode'))
" 2. source files in this order
	echo 'hoot <^@;@^>'
	call SourceDirectory('~/.config/nvim/site/config')
	call SourceDirectory('~/.config/nvim/site/plugin')
	call SourceDirectory('~/.config/nvim/site/after/config')
	call SourceDirectory('~/.config/nvim/site/after/plugin')
	call SourceDirectory('~/.config/nvim/site/after/ftplugin')
endif
"
" when in doubt, refer to @romainl's idiomatic vimrc
" https://gist.github.com/romainl/9ecd7b09a693816997ba
