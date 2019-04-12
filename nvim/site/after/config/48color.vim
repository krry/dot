if has('termguicolors')
    set termguicolors
end
"
" set hl=
" \ 8:specialkey,~:endofbuffer,z:termcursor,z:termcursornc,@:nontext,
" \ d:directory,e:errormsg,i:incsearch,l:search,m:moremsg,m:modemsg,
" \ n:linenr,n:cursorlinenr,r:question,s:statusline,s:statuslinenc,
" \ c:vertsplit,t:title,v:visual,v:visualnos,w:warningmsg,w:wildmenu,
" \ f:folded,f:foldcolumn,a:diffadd,c:diffchange,d:diffdelete,
" \ t:difftext,>:signcolumn,-:conceal,b:spellbad,p:spellcap,
" \ r:spellrare,l:spelllocal,+:pmenu,=:pmenusel,x:pmenusbar,
" \ x:pmenuthumb,*:tabline,#:tablinesel,_:tablinefill,!:cursorcolumn,
" \ .:cursorline,o:colorcolumn,q:quickfixline,0:whitespace,i:normalnc

" 50 colorschemes
" available:
    " gruvbox
    " PaperColor
colorscheme PaperColor
set colorcolumn=80

" overriding styles wrapped in an autocmd so it runs after colorscheme load
augroup Colorers
    autocmd!
    autocmd BufEnter * exe "hi! OverLength ctermbg=".(&bg=='light'?'203':'124')." guibg=".(&bg=='light'?'#ff9999':'#592929')
    autocmd BufEnter * match OverLength /\%80v.*/
    autocmd ColorScheme * hi! link StatusLine CursorLine
            \| hi! link ALEInfoLine MoreMsg
            \| hi! link ALEWarningLine WarningMsg
            \| hi! link ALEErrorLine Error
            \| hi! link Folded CursorLine
augroup END

