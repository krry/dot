
" ___  ____ ____ ___  _    ____ ___ ____
" |  \ |___ |  | |__] |    |___  |  |___
" |__/ |___ |__| |    |___ |___  |  |___

    " Deoplete completes from language servers and snippets
    if has('nvim')

        " get deoplete going on launch
        " let g:deoplete#enable_at_startup = 1

        function! ConfigureDeoplete()

            " go left to get out of popup
            inoremap <expr><C-h> deoplete#cancel_popup()

            inoremap <expr><C-g> deoplete#refresh()

            " go right <C-l> to extend popup
            inoremap <silent><expr><C-l> deoplete#complete_common_string()

            " if popup showing, close popup
            inoremap <silent><expr><cr> pumvisible() ? deoplete#close_popup()
            \ : (delimitMate#WithinEmptyPair() ?
            \ "\<C-R>=delimitMate#ExpandReturn()\<CR>" : "\<CR>")

            " to switch deoplete on and off
            nmap <leader>dpl deoplete#toggle()

        endfunction

        call ConfigureDeoplete()

        " set deoplete options
        call deoplete#custom#option({
            \ 'smart_case': v:true,
            \ 'camel_case': v:true,
            \ 'auto_refresh_delay': 10,
            \ 'min_pattern_length': 1,
            \ 'auto_complete': v:true,
            \ })
        " \ 'auto_complete_delay': 250,

        " don't autocomplete my comments, deo
        call deoplete#custom#source('_',
                    \ 'disabled_syntaxes', ['Comment'])

    endif

