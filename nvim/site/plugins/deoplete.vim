
" ___  ____ ____ ___  _    ____ ___ ____
" |  \ |___ |  | |__] |    |___  |  |___
" |__/ |___ |__| |    |___ |___  |  |___

    " " Deoplete completes from language servers and snippets
    " if &runtimepath =~? 'deoplete'
    "     " neocomplete likes this
    "     set completeopt+=noinsert
    "     " deoplete.nvim recommends this
    "     set completeopt+=noselect
    "     " Path to python interpreter for neovim
    "     let g:python3_host_prog  = '/usr/local/bin/python3'
    "     " Skip the check of neovim module
    "     let g:python3_host_skip_check = 1


    "     function! ConfigureDeoplete()

    "         " go left to get out of popup
    "         inoremap <expr><C-h> deoplete#cancel_popup()

    "         inoremap <expr><C-g> deoplete#refresh()

    "         " go right <C-l> to extend popup
    "         inoremap <silent><expr><C-l> deoplete#complete_common_string()

    "         " if popup showing, close popup
    "         inoremap <silent><expr><CR> pumvisible() ? deoplete#close_popup()
    "         \ : (delimitMate#WithinEmptyPair() ?
    "         \ '\<C-R>=delimitMate#ExpandReturn()\<CR>' : '\<CR>')

    "         " to switch deoplete on and off
    "         nmap <leader>dpt :call deoplete#toggle()

    "     endfunction

    "     " set deoplete options
    "     call deoplete#custom#option({
    "         \ 'smart_case': v:true,
    "         \ 'camel_case': v:true,
    "         \ 'auto_refresh_delay': 10,
    "         \ 'min_pattern_length': 1,
    "         \ 'auto_complete': v:true,
    "         \ 'require_same_filetype': v:false,
    "         \ })
    "     " \ 'auto_complete_delay': 250,

    "     " don't autocomplete my comments, deo
    "     call deoplete#custom#source('_',
    "                 \ 'disabled_syntaxes', ['Comment'])
    "     let g:deoplete#sources#go#gocode_binary = 'gocode'
    "     call deoplete#custom#source('omni', 'functions', {
    "         \ 'rust': 'rustcomplete#Complete',
    "         \ 'javascript': 'tern#Complete',
    "         \ 'python': 'jedi#Complete',
    "         \ 'go': 'go#Complete',
    "         \ 'html': 'htmlcomplete#CompleteTags'
    "         \ })

    "     call deoplete#custom#source('omni', 'input_patterns', {
    "         \ 'rust': 'rustcomplete#Complete',
    "         \ 'javascript': 'tern#Complete',
    "         \ 'python': 'jedi#Complete',
    "         \ 'go': 'go#Complete',
    "         \ })
    "     call ConfigureDeoplete()
    "     " get deoplete going on launch
    "     let g:deoplete#enable_at_startup = 1
    " endif

