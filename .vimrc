if !&compatible && !exists('$POSIXLY_CORRECT')
  if v:version >=700 && v:progname !=# 'vi'
    runtime vimrc
    finish
  endif
endif
