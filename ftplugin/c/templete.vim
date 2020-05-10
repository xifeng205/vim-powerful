" Vim global plugin for correcting typing mistakes
" Last Change: 2020 Oct 15
" Maintainer: cuiyunpeng <cuiyunpengvim.org>
" License:      This file is placed in the public domain.

if exists("b:loaded_add_templete")
    finish
endif
let b:loaded_add_templete = 1


if !hasmapto('<Plug>CTemplete')
    map <buffer>  <unique>  07  <Plug>CTemplete 
endif

noremap <buffer>  <unique> <script>  <Plug>CTemplete  <SID>AddTemplete
noremap <buffer> <SID>AddTemplete  :call <SID>AddTemplete()<cr>

function s:AddTemplete()
    call append(9,"#include <stdio.h>")
    call append(10,"")
    call append(11,"int main(int argc, char **argv)")
    call append(12,"{")
    call append(13, "")
    call append(14, "    return 0;")
    call append(15,"}")
endfunction

if !exists(":AddTemplete")
  command -buffer  -nargs=0  AddTemplete  :call s:AddTemplete()<cr>
endif


