
" _  _ _ _  _ _ _ _ _ _  _ _
" |  | | |\/| | | | | |_/  |
"  \/  | |  | |_|_| | | \_ |

    " Vimwiki links notes together and publishes them to web
    let wiki = {}
    " set wiki to store in Google Drive
    let wiki.path = '~/Drive/Code/wiki/'
    let wiki.path_html = '~/Drive/Code/wiki/html/'
    let wiki.css_name = 'css/wiki.css'
    let wiki.auto_export = 1

    let g:vimwiki_list = [wiki]

    let wiki.nested_syntaxes = {'rust': 'rust'}
    :nmap <leader>wb <Plug>VimwikiGoBackLink

