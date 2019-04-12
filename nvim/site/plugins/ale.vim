
" ____ _    ____
" |__| |    |___
" |  | |___ |___
"
    " Ale does the linting around these parts

    " ALE Key mapping
    nmap <leader>alet :ALEToggle<cr>
    nmap <leader>alegd :ALEGoToDefinition<cr>
    nmap <leader>alefr :ALEFindReferences<cr>
    nmap <leader>aled :ALEDetail<cr>

    " Ale does the linting
    " Error and warning signs.
    let g:ale_sign_error = '•'
    let g:ale_sign_warning = '?'
    let g:ale_sign_info = 'i'
    "
    " enable all linters for the filetype
    " let b:ale_linters = 'all'
    let g:ale_linters_ignore = {
        \ 'python': ['pylint'],
        \ }

    let g:ale_linters = {
        \ 'go':  'all',
        \ 'python': ['flake8', 'pyls'],
        \ 'rust': ['cargo', 'rls', 'rustfmt'],
        \ 'markdown': ['remark-lint'],
        \ 'html': ['jshint', 'hugo'],
        \ 'json': ['jsonlint'],
        \ 'css': ['stylelint'],
        \ 'scss': ['stylelint'],
        \ 'stylus': ['stylint'],
        \ 'vue': ['vls'],
        \ 'javascript': ['eslint']
        \ }
    " highlight ALESignColumnWithErrors ctermbg=176 ctermfg=16
    " highlight ALESignColumnWithoutErrors ctermbg=176 ctermfg=16

    let g:ale_list_vertical = 0             " open loclist/quickfix vertically
    let g:ale_echo_cursor = 1               " echo error when cursed (default 1)
    let g:ale_lint_delay = 450              " default 200
    let g:ale_lint_on_enter = 0             " less distracting at first buff
    let g:ale_sign_column_always = 1
    let g:ale_set_quickfix = 1
    let g:ale_cursor_detail = 0             " show preview window when cursed
    let g:ale_close_preview_on_insert = 1   " close preview when ya fix it
    " let g:ale_completion_enabled = 1        " may overlap with deoplete

    " to lint JSX and embedded styles and scripts
    " let g:ale_linter_aliases = {'html': ['html', 'javascript', 'css']}
    " let g:ale_linter_aliases = {'html': ['json', 'html', 'javascript', 'css']}

    " let g:ale_fixers = {'python': ['bar'], 'html': [], '*': ['foo']}
    let g:ale_fixers = {
    \   'json': [
    \       'jq',
    \       'fixjson',
    \   ],
    \   'css': [
    \       'stylelint',
    \   ],
    \   'javascript': [
    \       'prettier',
    \       'prettier-eslint'
    \   ],
    \}
    " let g:ale_fix_on_save = 1
    " let g:ale_completion_delay = 100                  " default 100
    " let g:ale_completion_max_suggestions = 100        " default 50
    " let g:ale_completion_excluded_words = ['it', 'describe']

    " Go linting options
    " let g:ale_go_go_options = 'go'

    " Python linting options
    " let g:ale_python_auto_pipenv = 3
    "
    " Rust linter options
    let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')
    let g:ale_rust_rls_toolchain = 'stable'  " change to 'nightly' when avails
    " let g:ale_rust_rustfmt_options = ''

    let g:ale_vim_vint_show_style_issues = 1

