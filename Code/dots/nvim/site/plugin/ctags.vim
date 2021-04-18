
" ____ ___ ____ ____ ____
" |     |  |__| | __ [__
" |___  |  |  | |__] ___]

    " Tags track identifiers across files
    nmap <C-t> :TagbarToggle<cr>

    " might need to run `npm install` from this
    " to get JS to tag: https://github.com/ternjs/tern_for_vim
    " Javascript
    let g:tagbar_type_javascript = {
          \ 'ctagstype': 'javascript',
          \ 'kinds': [
          \ 'A:arrays',
          \ 'P:properties',
          \ 'T:tags',
          \ 'O:objects',
          \ 'G:generator functions',
          \ 'F:functions',
          \ 'C:constructors/classes',
          \ 'M:methods',
          \ 'V:variables',
          \ 'I:imports',
          \ 'E:exports',
          \ 'S:styled components'
          \ ]}

    " Markdown
    let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
            \ 'h:Heading_L1',
            \ 'i:Heading_L2',
            \ 'k:Heading_L3'
        \ ]
    \ }

    " Rust
     let g:tagbar_type_rust = {
        \ 'ctagstype' : 'rust',
        \ 'kinds' : [
            \'T:types,type definitions',
            \'f:functions,function definitions',
            \'g:enum,enumeration names',
            \'s:structure names',
            \'m:modules,module names',
            \'c:consts,static constants',
            \'t:traits',
            \'i:impls,trait implementations',
        \]
        \}

    " R
    let g:tagbar_type_r = {
        \ 'ctagstype' : 'r',
        \ 'kinds'     : [
            \ 'f:Functions',
            \ 'g:GlobalVariables',
            \ 'v:FunctionVariables',
        \ ]
    \ }

    " Go
    let g:tagbar_type_go = {
        \ 'ctagstype': 'go',
        \ 'kinds' : [
            \'p:package',
            \'f:function',
            \'v:variables',
            \'t:type',
            \'c:const'
        \]
    \}

    " CSS
    let g:tagbar_type_css = {
    \ 'ctagstype' : 'Css',
        \ 'kinds'     : [
            \ 'c:classes',
            \ 's:selectors',
            \ 'i:identities'
        \ ]
    \ }

