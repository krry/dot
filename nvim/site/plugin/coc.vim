" .-. .-. .-.
" |   | | |
" `-' `-' `-'
"
" Extensions available:
" https://www.npmjs.com/search?q=keywords%3Acoc.nvim << Actual list
" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions << Explanation
" https://github.com/rafi/vim-config/blob/master/config/plugins/coc.vim

let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

" COMPLETION Keymaps
" Tab triggers completion popup and cycles through suggestions/snippets
inoremap <silent><expr> <Tab>
	    \ pumvisible() ? "\<C-n>" :
	    \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
	    \ <SID>check_back_space() ? "\<Tab>" :
	    \ coc#refresh()

" Shift-tab cycles backward
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Rafi's way
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() :
	    \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~? '\s'
endfunction

augroup user_plugin_coc
  autocmd!
  autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END

" jk to back out of completion popup
inoremap <expr> jk pumvisible() ? "<C-e>" : "<Esc>"
" use <c-space>for trigger completion
inoremap <silent><expr> <C-space> coc#refresh()
" Use <C-l> to trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> to select text for visual text of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Movement within 'ins-completion-menu'
imap <expr><C-j>   pumvisible() ? "\<Down>" : "\<C-j>"
imap <expr><C-k>   pumvisible() ? "\<Up>" : "\<C-k>"

" Scroll pages in menu
inoremap <expr><C-f> pumvisible() ? "\<PageDown>" : "\<Right>"
inoremap <expr><C-b> pumvisible() ? "\<PageUp>" : "\<Left>"
imap     <expr><C-d> pumvisible() ? "\<PageDown>" : "\<C-d>"
imap     <expr><C-u> pumvisible() ? "\<PageUp>" : "\<C-u>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" summon the doc
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Show doc
function! s:show_documentation()
	if (index(['vim', 'help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		let l:found = CocAction('doHover')
	endif
endfunction

" call prettier on this buffer
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
nnoremap <silent> <leader>pr :Prettier<cr>

nnoremap <leader>ci :CocInstall<space>
nnoremap <leader>coc :CocConfig<cr>
