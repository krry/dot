set tags=./.tags,.tags;

let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_file_list_command = {
      \ 'markers': {
      \ '.git': 'rg --files',
      \ },
      \ }
let g:gutentags_generate_on_new = 1
" let g:gutentags_ctags_exclude=['node_modules']
