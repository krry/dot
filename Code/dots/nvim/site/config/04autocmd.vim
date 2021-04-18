augroup a_little_help_plz
    autocmd!
    " Help is on the K!
    autocmd FileType vim setlocal keywordprg=:help
augroup END

" close if final buffer is netrw or the quickfix
augroup closing_time
    autocmd!
    "autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), '&filetype') == 'netrw' || &buftype == 'quickfix' |q|endif
    autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) || &buftype == 'quickfix' | q | endif
    "nmap - :Lexplore<cr>
    nmap - :NERDTreeToggle<cr>
augroup END

function! s:TightIndents()
    setl tabstop=2
    setl shiftwidth=2
    setl softtabstop=2
endfunction

augroup tight_indents
    autocmd!
    autocmd FileType {css,scss,html,vue,pug,js,javascript.jsx,json} call s:TightIndents()
    autocmd FileType markdown vmap <space><Bslash> :EasyAlign*<Bar><Enter>
augroup END

" Automatically reload the file if it is changed outside of Nvim, see
" https://unix.stackexchange.com/a/383044/221410. It seems that `checktime`
" command does not work in command line. We need to check if we are in command
" line before executing this command. See also http://tinyurl.com/y6av4sy9.
augroup auto_read
    autocmd!
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
                \ if mode() == 'n' && getcmdwintype() == '' | checktime | endif
    autocmd FileChangedShellPost * echohl WarningMsg
                \ | echo "File changed on disk. Buffer reloaded!" | echohl None
augroup END

" set filetypes as typescript.tsx
augroup setft_jsonc
  autocmd!
  autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
augroup END

augroup setft_jsonc
  autocmd!
  " tsconfig.json is actually jsonc, help TypeScript set the correct filetype
  autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
augroup END

augroup setft_gql
  autocmd!
  au BufNewFile,BufRead *.prisma setfiletype graphql
augroup END

" the next few are from @jdhao
" https://gist.github.com/jdhao/d592ba03a8862628f31cba5144ea04c2
" avoid smartcase in command line
augroup dynamic_smartcase
    autocmd!
    autocmd CmdLineEnter : set nosmartcase
    autocmd CmdLineLeave : set smartcase
augroup END

" More accurate syntax highlighting? (see `:h syn-sync`)
augroup accurate_syn_highlight
    autocmd!
    autocmd BufEnter * :syntax sync fromstart
augroup END

" Return to last edit position when opening a file
augroup resume_edit_position
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ | execute "normal! g`\"zvzz"
        \ | endif
augroup END
