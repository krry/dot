" loads after the plugin settings which are in:
" nvim/site/plugins/denite.vim
" augroup denite
"   autocmd!
"   nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
"   nnoremap <silent><buffer><expr> <tab> denite#do_map('choose_action')
"   nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
"   nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
"   nnoremap <silent><buffer><expr> s denite#do_map('do_action', 'split')
"   nnoremap <silent><buffer><expr> v denite#do_map('do_action', 'vsplit')
"   nnoremap <silent><buffer><expr> q denite#do_map('quit')
"   nnoremap <silent><buffer><expr> <Esc> denite#do_map('quit')
"   nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
"   nnoremap <silent><buffer><expr> V denite#do_map('toggle_select')
"   nnoremap <silent><buffer><expr> t denite#do_map('toggle_select').'j'
" augroup END
