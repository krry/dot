" .-. .-. .-.
" |   | | |
" `-' `-' `-'
"
" Extensions available:
" https://www.npmjs.com/search?q=keywords%3Acoc.nvim << Actual list
" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions << Explanation

set hidden
set shortmess+=c
set cmdheight=2
set updatetime=300
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Format whole buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)
" call pretter on this buffer
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" use <c-space>for trigger completion
imap <expr><c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use <C-l> to trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> to select text for visual text of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" CocMaps
" ask for more Coc
nnoremap <silent><leader>ci :CocInstall

" config yr Coc
nnoremap <silent><leader>cc :CocConfig<CR>

" Coc control!
nnoremap <silent><leader>cl :CocList<CR>

" Show diagnostic message of current position, no truncate.
nnoremap <silent><leader>cdi <Plug>(coc-diagnostic-info)

" Jump to next diagnostic position.
nnoremap <silent> ]c <Plug>(coc-diagnostic-next)

" Jump to previous diagnostic position.
nnoremap <silent> [c <Plug>(coc-diagnostic-prev)

" Jump to definition(s) of current symbol.
nnoremap <silent> gd <Plug>(coc-definition)
" Jump to type definition(s) of current symbol.
nnoremap <silent> gy <Plug>(coc-type-definition)
" Jump to implementation(s) of current symbol.
nnoremap <silent> gi <Plug>(coc-implementation)
" Jump to references of current symbol.
nnoremap <silent> gr <Plug>(coc-references)

" summon the doc
nnoremap <silent><leader>K :call <SID>show_doc()<CR>

" Show doc
function! s:show_doc()
    if &filetype ==# 'vim'
        execute 'h ' . expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Jump to declaration(s) of current symbol.
nnoremap <silent><leader>cdc <Plug>(coc-declaration)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup coccers
    autocmd!
    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END

" Remap for do codeAction of current line
nnoremap <leader>ac <Plug>(coc-codeaction)

" Get and run code action(s) with selected region.
" Works with both normal and visual mode.
nmap <leader>a <Plug>(coc-codeaction-selected)
vmap <leader>a <Plug>(coc-codeaction-selected)

" Fix autofix problem of current line
nnoremap <silent><leader>qf <Plug>(coc-fix-current)

" Open link under cursor.
nnoremap <silent><leader>col <Plug>(coc-openlink)

" Do command from codeLens of current line.
nnoremap <silent><leader>cola <Plug>(coc-codelens-action)
"
" Hide all float windows.
nnoremap <silent><leader>cofh <Plug>(coc-float-hide)

" Jump to first float window.
nnoremap <silent><leader>cofj <Plug>(coc-float-jump)
