
" Vim global plugin for correcting typing mistakes
" Last Change: 2020 Oct 15
" Maintainer: cuiyunpeng <cuiyunpengvim.org>
" License:      This file is placed in the public domain.
"
" if exists("g:loaded_addauthor")
"     finish
" endif
" let g:loaded_addauthor = 1
"
"
" if !hasmapto('<Plug>AuthorAddauthor')
"     " map <unique>  <F9>  <Plug>AuthorAddauthor 
" endif
"
" noremap <unique> <script>  <Plug>AuthorAddauthor  <SID>Addauthor
" noremap <SID>Addauthor  :call <SID>Addauthor()<cr>
"
"
"
"
" if !exists(":AddAuthor")
"   command -nargs=0  AddAuthor  :call s:Addauthor()<cr>
" endif
"
"
