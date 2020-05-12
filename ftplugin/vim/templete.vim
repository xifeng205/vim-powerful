" Vim global plugin for correcting typing mistakes
" Last Change: 2020 Oct 15
" Maintainer: cuiyunpeng <cuiyunpengvim.org>
" License:      This file is placed in the public domain.

if exists("b:loaded_add_templete")
    finish
endif
let b:loaded_add_templete = 1


if !hasmapto('<Plug>CTemplete')
    map <buffer>  <unique>  07  <Plug>VimTemplete 
endif

noremap <buffer>  <unique> <script>  <Plug>VimTemplete  <SID>AddTemplete
noremap <buffer> <SID>AddTemplete  :call <SID>AddTemplete()<cr>

function s:AddTemplete()
    :read templete
endfunction

if !exists(":AddTemplete")
    command -buffer  -nargs=0  AddTemplete  :call s:AddTemplete()<cr>
endif


