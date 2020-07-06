
" ___  ____ _  _ _ ___ ____
" |  \ |___ |\ | |  |  |___
" |__/ |___ | \| |  |  |___

" Denite fuzzy searches, launches, does all the things!

try

" from Shougo's denite docs
" first we must define our mappings

augroup DENITE
    autocmd!
    autocmd FileType denite call s:denite_my_settings()
    function! s:denite_my_settings() abort
        nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
        nnoremap <silent><buffer><expr> <tab> denite#do_map('choose_action')
        nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
        nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
        nnoremap <silent><buffer><expr> s denite#do_map('do_action', 'split')
        nnoremap <silent><buffer><expr> v denite#do_map('do_action', 'vsplit')
        nnoremap <silent><buffer><expr> q denite#do_map('quit')
        nnoremap <silent><buffer><expr> <Esc> denite#do_map('quit')
        nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
        nnoremap <silent><buffer><expr> V denite#do_map('toggle_select')
        nnoremap <silent><buffer><expr> t denite#do_map('toggle_select').'j'
    endfunction
    autocmd FileType denite-filter call s:denite_filter_my_settings()
    function! s:denite_filter_my_settings() abort
        map <silent><buffer> <Esc> <Plug>(denite_filter_quit)
        imap <silent><buffer> <Esc> <Plug>(denite_filter_quit)
        map <silent><buffer> <CR> <Plug>(denite_filter_update)
        imap <silent><buffer> <CR> <Plug>(denite_filter_update)
    endfunction
augroup end

" to search for files

" fd is the bomb at find
" custom options for `fd` (which is a superfast `find` replacement)
"  --type=f       - no dirs, just files
"  --follow       - search to the leaves of the trees
"  --hidden       - search dotfiles and other hidden stuff
"  --full-path    - consider the whole path, not just the
"  --color=never  - would be a waste here since denite cleans it
"  --exclude=.git - because eww

let s:denite_fd_command = ['fd', '--type=f', '--follow',
            \ '--hidden', '--full-path', '--color=never',
            \'--exclude=.git', '']

let g:denite#_python_version_check = '3'

" then establish a custom command called 'fd'
call denite#custom#var('file', 'command', s:denite_fd_command)
call denite#custom#var('file/rec', { 'command': ['rg', '--files',  '--glob', '!.git'] })

" ripgrep is for closers
call denite#custom#var('grep', 'command', ['rg'])

" you can also add the options to the command ex post facto
"  --mmap               # not sure
"  --threads=12         # multi-threaded makes it fast
"  --hidden             # what you seek might be hidden
"  --smart-case         # only case the search if the query is cased
"  --vimgrep            # not sure
"  --no-heading         # return just the results
"  --glob=!.git         # make sure to exclude .git files
"  --glob=!node_modules # same with node_modules, pretend they ain't there

" recommended options for ripgrep from the denite docs
call denite#custom#var('grep', {
		    \ 'command': ['rg'],
		    \ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
		    \ 'recursive_opts': [],
		    \ 'pattern_opt': ['--regexp'],
		    \ 'separator': ['--'],
		    \ 'final_opts': [],
		    \ })

" and line search, ripgrep does that too
call denite#custom#var('line', 'command', ['rg', '--files'])

" remove date from buffer search
call denite#custom#var('buffer', 'date_format', '')

" custom source aliases
" tell denite to use fruzzy matcher by default for all sources
call denite#custom#source('_', 'matchers', ['matcher/fruzzy'])
call denite#custom#source('grep', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])

" denite options:
let s:denite_options = {'default': {
    \ 'auto_resize': v:true,
    \ 'auto_accel': v:false,
    \ 'split': 'floating',
    \ 'direction': 'topleft',
    \ 'empty': v:false,
    \ 'highlight_preview_line': 'Special',
    \ 'prompt': 'ƛ',
    \ 'prompt_highlight': 'Function',
    \ 'reversed': v:true,
    \ 'short_source_names': v:true,
    \ 'sorter': 'sorter/word',
    \ 'unique': v:true,
    \ 'vertical_preview': v:true,
    \ }}

" unused options
"    \ 'highlight_matched_char': 'Function',
"    \ 'highlight_matched_range': 'Normal',
"    \ 'highlight_mode_insert': 'Visual',
"    \ 'highlight_mode_normal': 'Visual',
"
" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)

" quickeys for your fave denite filters
nnoremap <leader>df :<C-u>Denite file/rec -no-empty<CR>
nnoremap <leader>dg :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>dh :<C-u>Denite help -no-empty -start-filter<CR>
nnoremap <leader>dl :<C-u>Denite line<CR>
nnoremap <leader>dt :<C-u>Denite tags<CR>
nnoremap <leader>db :<C-u>Denite buffer<CR>
nnoremap <leader>dj :<C-u>DeniteCursorWord grep:.<CR>
nnoremap <leader>jt :<C-u>DeniteCursorWord tags<CR>
nnoremap <leader>jf :<C-u>DeniteCursorWord file/rec<CR>
nnoremap <leader>jh :<C-u>DeniteCursorWord help<CR>
" nnoremap <leader>dfb :<C-u>DeniteBufferDir file/rec  -start-filter<CR>
" nnoremap <leader>dgb :<C-u>DeniteBufferDir grep -no-empty<CR>
nnoremap <leader>dpf :<C-u>DeniteProjectDir file/rec -start-filter <CR>
nnoremap <leader>dpg :<C-u>DeniteProjectDir grep<CR>
nnoremap <leader>ds :<C-u>Denite source <cr>
nnoremap <leader>dd :<C-u>Denite -resume -cursor-pos=+1<CR>

catch
  echo 'Denite not installed. It should work after running :PlugInstall'
endtry
