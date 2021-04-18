" Entry point
function! put_blank_lines#(above) abort
  let &operatorfunc = 'put_blank_lines#'
        \ . (a:above ? 'Above' : 'Below')
  return 'g@^'
endfunction

" Operator functions
let s:space = nr2char(10)
function! put_blank_lines#Above(type) abort
  silent put! =repeat(s:space, v:count1)
  ']+1
endfunction
function! put_blank_lines#Below(type) abort
  silent put =repeat(s:space, v:count1)
  '[-1
endfunction
