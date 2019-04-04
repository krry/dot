" 8"""8
" 8   8  e   e eeeee eeeee
" 8eee8e 8   8 8   "   8
" 88   8 8e  8 8eeee   8e
" 88   8 88  8    88   88
" 88   8 88ee8 8ee88   88
"

" Racer
" you don't need to see what racer is doing
" Required for operations modifying multiple buffers like rename.
" set hidden
"
" augroup rusters
    " autocmd!
    " autocmd FileType rust nnoremap <buffer> <leader>K  <plug>DeopleteRustShowDocumentation
    " autocmd FileType rust nnoremap <buffer> <leader>gd <plug>DeopleteRustGoToDefinitionDefault
    " autocmd FileType rust nnoremap <buffer> <leader>gds <plug>DeopleteRustGoToDefinitionSplit
    " autocmd FileType rust nnoremap <buffer> <leader>gdv <plug>DeopleteRustGoToDefinitionVSplit
    " autocmd FileType rust nnoremap <buffer> <leader>gdt <plug>DeopleteRustGoToDefinitionTab
" augroup END
"

" braced blocks are folded. All folds are open by default.
" let g:rust_fold = 1

" vim-racer wants to know where racer is
" let g:racer_cmd = '/Users/alan/.cargo/bin/racer'
" let g:racer_experimental_completer = 1
"
" Set fully qualified path to racer binary.
" If it is in your PATH already use which racer. (required)
" let g:deoplete#sources#rust#racer_binary=g:racer_cmd
"
" Set Rust source code path (when cloning from Github usually ending on /src). (required)
" let g:deoplete#sources#rust#rust_source_path='/Users/alan/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src'
"
" Set racer as the source for omnifunc completion
" let g:deoplete#omni#functions#rust = ['racer#Complete']

"Show duplicate matches.
"let g:deoplete#sources#rust#show_duplicates=1

"To disable default key mappings (gd & K) add the following
"let g:deoplete#sources#rust#disable_keymap=1

"Set max height of documentation split.
"let g:deoplete#sources#rust#documentation_max_height=20

