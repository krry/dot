if has('termguicolors')
    set termguicolors
end

" add'l highlight-groups
" NormalFloat

" use $THEME env variable if available
set background=dark
colorscheme deep-space

" execute 'set bg='.$THEME

" 50 colorschemes         " available:
" colorscheme PaperColor  " dark and light, better dark
" colorscheme anderson    " muted and classy brown
" colorscheme deep-space  " blueshift, cool dark
" colorscheme lightning   " light and stark
colorscheme molokayo    " dark hi contrast
" colorscheme one         " light and dark ****
" colorscheme sonokai     " nice monokai rendition
" colorscheme Atom        " nice middle ground

set colorcolumn=80

" overriding styles wrapped in an autocmd so it runs after colorscheme load
augroup Colorers
    autocmd!
    " autocmd BufEnter * exe "hi! OverLength ctermbg=".(&bg=='light'?'203':'124')." guibg=".(&bg=='light'?'#ff9999':'#592929')
    " autocmd BufEnter * match OverLength /\%80v.*/
    autocmd ColorScheme * hi! link StatusLine CursorLine
            " \| hi! link ALEInfoLine MoreMsg
            " \| hi! link ALEWarningLine WarningMsg
            " \| hi! link ALEErrorLine Error
            \| hi! link Folded CursorLine
augroup END

