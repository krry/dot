"  8""""8
"  8    " eeeee e     eeeee eeeee eeeee
"  8e     8  88 8     8   8 8   8 8   8
"  88  ee 8   8 8e    8eee8 8e  8 8e
"  88   8 8   8 88    88  8 88  8 88 "8
"  88eee8 8eee8 88eee 88  8 88  8 88ee8
"

" turn on all the syntax highlighters
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

" highlight other instances of the identifier under the cursor
let g:go_auto_sameids = 1

let g:go_fmt_command = 'goimports'

let g:go_snippet_engine = 'neosnippet'
