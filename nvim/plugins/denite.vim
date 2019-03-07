
" ___  ____ _  _ _ ___ ____
" |  \ |___ |\ | |  |  |___
" |__/ |___ | \| |  |  |___

    " Denite fuzzy searches, launches, does all the things!

    " thx to sodiumjoe: https://github.com/sodiumjoe/dotfiles/blob/master/vimrc
    " custom prompt symbol
    call denite#custom#option('default', { 'prompt': '❯' })

    " to search for files
    call denite#custom#var('file_rec', 'command',
                \ ['ag', '--follow', '--nocolor', '--nogroup', '-u', '-g', ''])
                " -u flag to unrestrict (see ag docs)
    " to search in git files
    call denite#custom#var('file_rec/git', 'command',
                \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
    " to search in files and git
    call denite#custom#alias('source', 'file_rec/git', 'file_rec')

    " to grep for contents
    call denite#custom#var('grep', 'command', ['rg'])
    call denite#custom#var('grep', 'default_opts',
          \ ['--hidden', '--vimgrep', '--smart-case'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])

    call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>',
          \'noremap')
    "call denite#custom#map('normal', '<Esc>', '<NOP>', 'noremap')
    call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>',
          \'noremap')
    call denite#custom#map('normal', '<C-v>', '<denite:do_action:vsplit>',
          \'noremap')
    call denite#custom#map('normal', 'dw', '<denite:delete_word_after_caret>',
          \'noremap')

    nnoremap <leader>de :<C-u>Denite file_rec<CR>
    nnoremap <leader>db :<C-u>Denite buffer<CR>
    nnoremap <leader>dbd :<C-u>DeniteBufferDir buffer<CR>
    nnoremap <leader>d* :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
    nnoremap <leader>dg :<C-u>Denite grep:. -mode=normal<CR>
    nnoremap <leader>dbg :<C-u>DeniteBufferDir grep:. -mode=normal<CR>
    nnoremap <leader>df :<C-u>DeniteBufferDir file_rec<CR>
    nnoremap <leader>dr :<C-u>Denite -resume -cursor-pos=+1<CR>
    nnoremap <leader>d<C-r> :<C-u>Denite register:. -mode=normal<CR>
    " references source from LanguageClient
    nnoremap <leader>dlr :<C-u>Denite references -mode=normal<CR>

    hi link deniteMatchedChar Special

    call denite#custom#option('_', {
                \ 'auto_preview': v:true,
                \ 'vertical_preview': v:true,
                \})
