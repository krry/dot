"
" put_blank_lines.vim: Provide plugin maps to put blank lines above or below
" the current line.
"
" Author: Tom Ryder <tom@sanctum.geek.nz>
" License: Same as Vim itself
"
if exists('loaded_put_blank_lines') || &compatible || v:version < 700
  finish
endif
let loaded_put_blank_lines = 1

" Set up mappings to autoloaded functions
nnoremap <expr> <Plug>(PutBlankLinesBelow)
      \ put_blank_lines#(0)
nnoremap <expr> <Plug>(PutBlankLinesAbove)
      \ put_blank_lines#(1)
