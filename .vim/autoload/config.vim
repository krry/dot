function! config#Vimrc() abort
  edit $HOME/.vim/vimrc
  echomsg 'editing '.fnamemodify($MYVIMRC, ':p:~')
endfunction
