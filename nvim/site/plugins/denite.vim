
" ___  ____ _  _ _ ___ ____
" |  \ |___ |\ | |  |  |___
" |__/ |___ | \| |  |  |___

    " Denite fuzzy searches, launches, does all the things!

    " thx to sodiumjoe: https://github.com/sodiumjoe/dotfiles/blob/master/vimrc
    " custom prompt symbol
    call denite#custom#option('_', {
                \ 'auto-highlight': v:true,
                \ 'auto_accel': v:false,
                \ 'empty': v:false,
                \ 'highlight-matched-char': 'DeniteMatchedChar',
                \ 'highlight-matched-range': 'DeniteMatchedRange',
                \ 'highlight-preview-line': 'DenitePreviewLine',
                \ 'prompt': '❯',
                \ 'short_source_names': v:true,
                \ 'sorter': 'sorter/word',
                \ 'unique': v:true,
                \ 'vertical_preview': v:true,
                \ 'winheight': 20,
                \ })

    " to search for files
    let s:denite_fd_command = ['fd', '--type=f', '--follow',
                \ '--hidden', '--full-path', '--color=never',
                \'--exclude=.git', '']
    let s:denite_rec_fd_command = ['fd', '--type=f', '--follow',
                \ '--hidden', '--full-path', '--color=never',
                \'--exclude=.git', '']
    " fd is the bomb at find
    call denite#custom#var('fd', 'command', s:denite_fd_command)
    call denite#custom#var('rec_fd', 'command',
                \ s:denite_rec_fd_command)

    " ripgrep is for closers
    call denite#custom#var('grep/rg', 'command', ['rg'])
    call denite#custom#var('grep/rg', 'default_opts',
                \ ['--mmap', '--threads=12', '--hidden', '--smart-case',
                \ '--vimgrep', '--no-heading',
                \ '--glob=!.git', '--glob=!node_modules'])
    call denite#custom#var('grep/rg', 'recursive_opts', [])
    call denite#custom#var('grep/rg', 'pattern_opt', ['--regexp'])
    call denite#custom#var('grep/rg', 'separator', ['--'])
    call denite#custom#var('grep/rg', 'final_opts', [])
    " and line search
    call denite#custom#var('line/rg', 'command',
                \ ['rg', '--files', '--glob', '!.git', ''])

    " custom source aliases
    call denite#custom#alias('source', 'fd', 'file')
    call denite#custom#alias('source', 'rec_fd', 'file/rec')
    call denite#custom#alias('source', 'grep/rg', 'grep')
    call denite#custom#alias('source', 'line/rg', 'line')

    " map it easy
    " seal it with a carriage return
    call denite#custom#map('insert', '<CR>',
    \ '<denite:do_action:default>', 'noremap')
    " easier than <C-o> which I forget
    call denite#custom#map('insert', '<Esc>',
    \ '<denite:enter_mode:normal>', 'noremap')
    " which matches custom NERDTree behavior
    call denite#custom#map('insert', '<C-v>',
    \ '<denite:multiple_mappings:denite:do_action:vsplit>', 'noremap')
    call denite#custom#map('insert', '<C-s>',
    \ '<denite:multiple_mappings:denite:do_action:split>', 'noremap')
    call denite#custom#map('insert', '<Down>',
    \ '<denite:move_to_next_line>', 'noremap')
    call denite#custom#map('insert', '<Up>',
    \ '<denite:move_to_previous_line>', 'noremap')

    " quickeys for your fave denite dances
    nnoremap <leader>ds :Denite source<cr>
    " for recursive file search with `fd`
    nnoremap <leader>df :<C-u>Denite rec_fd<CR>
    " for rippin' fast greps
    nnoremap <leader>dg :<C-u>Denite grep/rg<CR>
    " for line by line ripgrep action
    nnoremap <leader>dl :<C-u>Denite line<CR>
    " only search the buffers
    nnoremap <leader>db :<C-u>Denite buffer<CR>
    " this kicks asterisk
    nnoremap <leader>d* :<C-u>DeniteCursorWord grep:.<CR>
    " in case you've jump to a distant filetree
    nnoremap <leader>dbf :<C-u>DeniteBufferDir file/rec<CR>
    nnoremap <leader>dbg :<C-u>DeniteBufferDir grep<CR>
    nnoremap <leader>dbd :<C-u>DeniteBufferDir buffer<CR>
    " not sure what these do yet
    nnoremap <leader>dr :<C-u>Denite -resume -cursor-pos=+1<CR>
    nnoremap <leader>d<C-r> :<C-u>Denite register:. -mode=normal<CR>
    " references source from LanguageClient
    nnoremap <leader>dlr :<C-u>Denite references -mode=normal<CR>

    hi link deniteMatchedChar Special
    hi link deniteMatchedRange Special
    hi link denitePreviewLine Special

