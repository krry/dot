
" ___  ____ _  _ _ ___ ____
" |  \ |___ |\ | |  |  |___
" |__/ |___ | \| |  |  |___

" Denite fuzzy searches, launches, does all the things!

if exists('*denite#start')
  finish
endif

try

" from Shougo's denite docs
" first we must define our mappings

" see nvim/site/after/ftplugin/denite.vim
" and nvim/site/after/ftplugin/denite-filter.vim

let g:denite#_python_version_check = '3'

" Denite general settings
call denite#custom#option('_', {
	\ 'max_dynamic_update_candidates': 50000,
  \ 'prompt': '⎈',
  \ 'short_source_names': v:true,
	\ 'start_filter': 1,
	\ 'statusline': 1,
	\ 'smartcase': 1,
  \ 'unique': v:true,
	\ 'vertical_preview': 1,
	\ })

" Use Neovim's floating window
if has('nvim')
	call denite#custom#option('_', {
		\ 'statusline': 0,
		\ 'split': 'floating',
		\ 'floating_preview': 1,
		\ 'filter_split_direction': 'floating',
		\ })
endif
"
" MATCHERS
" Default is 'matcher/fuzzy'
call denite#custom#source('tag', 'matchers', ['matcher/substring'])

" SORTERS
" Default is 'sorter/rank'
call denite#custom#source('z', 'sorters', ['sorter_z'])

" CONVERTERS
" Default is none
call denite#custom#source(
	\ 'buffer,file_mru,file_old',
	\ 'converters', ['converter_relative_word'])

" tell denite to use fruzzy matcher by default for all sources
call denite#custom#source('_', 'matchers', ['matcher/fruzzy'])
call denite#custom#source('grep', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])
call denite#custom#source('grep', 'args', ['', '', '!'])

" Allow customizable window positions: top, bottom, center (default)
function! s:denite_resize(position)
	if a:position ==# 'top'
		call denite#custom#option('_', {
			\ 'winwidth': (&columns - (&columns / 3)) - 1,
			\ 'winheight': &lines / 3,
			\ 'wincol': 0,
			\ 'winrow': 1,
			\ })
	elseif a:position ==# 'bottom'
		call denite#custom#option('_', {
			\ 'winwidth': (&columns - (&columns / 3)) - 1,
			\ 'winheight': &lines / 3,
			\ 'wincol': 0,
			\ 'winrow': (&lines - 2) - (&lines / 3),
			\ })
	else
		" Use Denite default, which is centered.
	endif
endfunction

" Set Denite's window position
let g:denite_position = get(g:, 'denite_position', '')
call s:denite_resize(g:denite_position)

" FIND
" to search for files

" fd is the bomb at find
" custom options for `fd` (which is a superfast `find` replacement)
"  --type=f       - no dirs, just files
"  --follow       - search to the leaves of the trees
"  --hidden       - search dotfiles and other hidden stuff
"  --full-path    - consider the whole path, not just the
"  --color=never  - would be a waste here since denite cleans it
"  --exclude=.git - because eww

if executable('fd')
  let s:denite_fd_command = ['fd', '--type=f', '--follow',
        \ '--hidden', '--full-path', '--color=never',
        \'--exclude=.git', '']

  " then establish a custom command called 'fd'
  call denite#custom#var('file', 'command', s:denite_fd_command)
endif

" GREP
" ripgrep is for closers

if executable('rg')
  call denite#custom#var('file/rec', { 'command': ['rg', '--files',  '--glob', '!.git'] })

  call denite#custom#var('line', 'command', ['rg', '--files'])

  " remove date from buffer search
  call denite#custom#var('buffer', 'date_format', '')

  " recommended options for ripgrep from the denite docs
  call denite#custom#var('grep', {
		    \ 'command': ['rg'],
		    \ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
        \ 'min_interactive_pattern': 2,
		    \ 'recursive_opts': [],
		    \ 'pattern_opt': ['--regexp'],
		    \ })
endif

" KEYMAPS
augroup user_plugin_denite
  autocmd!

  autocmd FileType denite call s:denite_settings()
  autocmd FileType denite-filter call s:denite_filter_settings()

  autocmd User denite-preview call s:denite_preview()

  autocmd VimResized * call s:denite_resize(g:denite_position)

	" Enable Denite special cursor-line highlight
	autocmd WinEnter * if &filetype =~# '^denite'
		\ |   highlight! link CursorLine WildMenu
		\ | endif

	" Disable Denite special cursor-line highlight
	autocmd WinLeave * if &filetype ==# 'denite'
		\ |   highlight! link CursorLine NONE
		\ | endif
augroup END

" Denite main window settings
function! s:denite_settings() abort
	" Window options
	setlocal signcolumn=no cursorline

	" Denite selection window key mappings
	nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
	nnoremap <silent><buffer><expr> i    denite#do_map('open_filter_buffer')
	nnoremap <silent><buffer><expr> /    denite#do_map('open_filter_buffer')
	nnoremap <silent><buffer><expr> dd   denite#do_map('do_action', 'delete')
	nnoremap <silent><buffer><expr> p    denite#do_map('do_action', 'preview')
	nnoremap <silent><buffer><expr> t   denite#do_map('do_action', 'tabopen')
	nnoremap <silent><buffer><expr> v   denite#do_map('do_action', 'vsplit')
	nnoremap <silent><buffer><expr> s   denite#do_map('do_action', 'split')
	nnoremap <silent><buffer><expr> '    denite#do_map('quick_move')
	nnoremap <silent><buffer><expr> q    denite#do_map('quit')
	nnoremap <silent><buffer><expr> r    denite#do_map('redraw')
	nnoremap <silent><buffer><expr> yy   denite#do_map('do_action', 'yank')
	nnoremap <silent><buffer><expr> <Esc>   denite#do_map('quit')
	nnoremap <silent><buffer><expr> <Tab>   denite#do_map('choose_action')
	nnoremap <silent><buffer><expr><nowait> <Space> denite#do_map('toggle_select').'j'
endfunction

" Denite-filter window settings
function! s:denite_filter_settings() abort
	" Window options
	setlocal signcolumn=yes nocursorline nonumber norelativenumber

	" Disable Deoplete auto-completion within Denite filter window
	if exists('*deoplete#custom#buffer_option')
		call deoplete#custom#buffer_option('auto_complete', v:false)
	endif

	" Denite Filter window key mappings
	imap <silent><buffer> jj          <Plug>(denite_filter_quit)
	nmap <silent><buffer> <Esc>       <Plug>(denite_filter_quit)
	imap <silent><buffer> <Esc>       <Plug>(denite_filter_quit)
	nmap <silent><buffer> <C-c>       <Plug>(denite_filter_quit)
	imap <silent><buffer> <C-c>       <Plug>(denite_filter_quit)
  nmap <silent><buffer> <CR>        <Plug>(denite_filter_update)
  imap <silent><buffer> <CR>        <Plug>(denite_filter_update)

	inoremap <silent><buffer> <Tab> <Esc>
		\ :call denite#move_to_parent()<CR>
		\ :call cursor(line('.')+1,0)<CR>
		\ :call denite#move_to_filter()<CR>A
	inoremap <silent><buffer> <S-Tab> <Esc>
		\ :call denite#move_to_parent()<CR>
		\ :call cursor(line('.')-1,0)<CR>
		\ :call denite#move_to_filter()<CR>A
endfunction

" Denite-preview window settings
function! s:denite_preview() abort
	" Window options
	setlocal nocursorline colorcolumn= signcolumn=no nonumber nolist nospell

	if &lines > 35
		resize +8
	endif
	" let l:pos = win_screenpos(win_getid())
	" let l:heighten = &lines - l:pos[0]
	" execute 'resize ' . l:heighten

	" Clear indents
	if exists('*indent_guides#clear_matches')
		call indent_guides#clear_matches()
	endif
endfunction

" quickeys for your fave denite filters
nnoremap <leader>y :<C-u>Denite file/rec grep:::! -start-filter<CR>
nnoremap <leader>dg :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>dh :<C-u>Denite help -no-empty -start-filter<CR>
nnoremap <leader>dt :<C-u>Denite tags<CR>
nnoremap <leader>dl :<C-u>Denite line<CR>
nnoremap <leader>db :<C-u>Denite buffer<CR>
nnoremap <leader>jj :<C-u>DeniteCursorWord file/rec grep:::!<CR>
nnoremap <leader>jt :<C-u>DeniteCursorWord tags<CR>
nnoremap <leader>jh :<C-u>DeniteCursorWord help<CR>
vnoremap <C-j> :<C-u>DeniteCursorWord file/rec grep:::!<CR>
vnoremap <C-t> :<C-u>DeniteCursorWord tags<CR>
vnoremap <C-h> :<C-u>DeniteCursorWord help<CR>
" nnoremap <leader>dfb :<C-u>DeniteBufferDir file/rec  -start-filter<CR>
" nnoremap <leader>dgb :<C-u>DeniteBufferDir grep -no-empty<CR>
" nnoremap <leader>dpf :<C-u>DeniteProjectDir file/rec -start-filter <CR>
" nnoremap <leader>dpg :<C-u>DeniteProjectDir grep<CR>
nnoremap <leader>ds :<C-u>Denite source <cr>
nnoremap <leader>dd :<C-u>Denite -resume -cursor-pos=+1<CR>

catch
  echo 'Denite not installed. It should work after running :PlugInstall'
endtry
