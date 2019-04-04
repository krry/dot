" Function: display errors from Ale in statusline
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '' : printf(
                \ ' W:%d E:%d ',
                \ l:all_non_errors,
                \ l:all_errors
                \)
endfunction

function! Statusline() abort
    let l:line=''
    let l:line.='%#Comment#%5.c '
    let l:line.='%#Debug#%{coc#status()}%*'
    " let l:line.='%#Debug#%{LinterStatus()}%*'
    let l:line.='%#Debug#%{gutentags#statusline()}%*'
    let l:line.='%#CursorLine#%<'
    let l:line.='%='
    let l:line.='%10.50f'
    let l:line.='%( [%M%R%H]%)'
    let l:line.='%='
    let l:line.='%#agitHead# %{fugitive#head()} '
    return l:line
endfunction

set statusline=%!Statusline()
