" Vim global plugin for correcting typing mistakes
" Last Change: 2020 Oct 15
" Maintainer: cuiyunpeng <cuiyunpengvim.org>
" License:      This file is placed in the public domain.

if exists("g:loaded_addauthor")
    finish
endif
let g:loaded_addauthor = 1


if !hasmapto('<Plug>AuthorAddauthor')
    map <unique>  <F9>  <Plug>AuthorAddauthor 
endif

noremap <unique> <script>  <Plug>AuthorAddauthor  <SID>Addauthor
noremap <SID>Addauthor  :call <SID>Addauthor()<cr>


" 表示非c结尾的文件添加此函数注释
function g:AddTitleForC()
    call append(0,"/*********************************************************************")
    call append(1," * Author        : cuiyunpeng")
    call append(2," * Email         : @163.com")
    call append(3," * Create time   : ".strftime("%Y-%m-%d %H:%M"))
    call append(4," * Last modified : ".strftime("%Y-%m-%d %H:%M"))
    call append(5," * Filename      : ".expand("%:t"))
    call append(6," * Description   : ")
    call append(7,"*********************************************************************/")
endfunction

" 表示非c结尾的文件添加此函数注释
function g:AddTitleForCpp()
    call append(0,"/*********************************************************************")
    call append(1," * Author        : cuiyunpeng")
    call append(2," * Email         : @163.com")
    call append(3," * Create time   : ".strftime("%Y-%m-%d %H:%M"))
    call append(4," * Last modified : ".strftime("%Y-%m-%d %H:%M"))
    call append(5," * Filename      : ".expand("%:t"))
    call append(6," * Description   : ")
    call append(7,"*********************************************************************/")
endfunction


" 表示.py添加此函数注释
function g:AddTitleForPython()
    call append(0,"#!/usr/bin/env python")
    call append(1,"# _*_  coding: utf-8 _*_")
    call append(2,"''''")
    call append(3," ********************************************************************")
    call append(4," * Author        : cuiyunpeng")
    call append(5," * Email         : @163.com")
    call append(6," * Create time   : ".strftime("%Y-%m-%d %H:%M"))
    call append(7," * Last modified : ".strftime("%Y-%m-%d %H:%M"))
    call append(8," * Filename      : ".expand("%:t"))
    call append(9," * Description   : ")
    call append(10,"*********************************************************************")
    call append(11,"''''")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction

" 表示.vim添加此函数注释
function g:AddTitleForVim()
    call append(0," '*******************************************************************")
    call append(1," ' Author        : cuiyunpeng")
    call append(2," ' Email         : @163.com")
    call append(3," ' Create time   : ".strftime("%Y-%m-%d %H:%M"))
    call append(4," ' Last modified : ".strftime("%Y-%m-%d %H:%M"))
    call append(5," ' Filename      : ".expand("%:t"))
    call append(6," ' Description   : ")
    call append(7,"'********************************************************************")
endfunction
" 表示.sh文件添加此行数注释
function g:AddTitleForShell()
    call append(0,"#!/usr/bin/env bash")
    call append(1,"# *******************************************************************")
    call append(2,"# * Author        : cuiyunpeng")
    call append(3,"# * Email         : @163.com")
    call append(4,"# * Create time   : ".strftime("%Y-%m-%d %H:%M"))
    call append(5,"# * Last modified : ".strftime("%Y-%m-%d %H:%M"))
    call append(6,"# * Filename      : ".expand("%:t"))
    call append(7,"# * Description   : ")
    call append(8,"# *******************************************************************")
endfunction

function s:Addauthor()
    let n=1
    while n < 11
        let line = getline(n)
        if line=~'[#]*\s*\*\s*\S*Last\s*modified\s*:\s*\S*.*$'
        " call UpdateTitle()
        return
    endif
    let n = n + 1
    endwhile
    if &filetype == 'sh'
        call AddTitleForShell()
    elseif &filetype == 'python'
        call AddTitleForPython()
    elseif &filetype == 'c' 
        call AddTitleForC()
    elseif &filetype == 'cpp' 
        call AddTitleForCpp()
    elseif &filetype == 'vim' 
        call AddTitleForVim()
    endif

endfunction
"取得光标处的匹配
" function! GetPatternAtCursor(pat)
"     let col = col('.') - 1
"     let line = getline('.')
"     let ebeg = -1
"     let cont = match(line, a:pat, 0)
"     while (ebeg >= 0 || (0 <= cont) && (cont <= col))
"         let contn = matchend(line, a:pat, cont)
"         if (cont <= col) && (col < contn)
"             let ebeg = match(line, a:pat, cont)
"             let elen = contn - ebeg
"             break
"         else
"             let cont = match(line, a:pat, contn)
"         endif
"     endwh
"     if ebeg >= 0
"         return strpart(line, ebeg, elen)
"     else
"         return ""
"     endif
" endfunction
"
" =========
" 图形界面
" =========
" if has("autocmd")
"     filetype plugin indent on
"
"     " 括号自动补全
"     func! AutoClose()
"         :inoremap ( ()<ESC>i
"         ":inoremap " ""<ESC>i
"         ":inoremap ' ''<ESC>i
"         :inoremap { {}<ESC>i
"         :inoremap [ []<ESC>i
"         :inoremap ) <c-r>=ClosePair(')')<CR>
"         :inoremap } <c-r>=ClosePair('}')<CR>
"         :inoremap ] <c-r>=ClosePair(']')<CR>
"     endf
"
"     func! ClosePair(char)
"         if getline('.')[col('.') - 1] == a:char
"             return "\<Right>"
"         else
"             return a:char
"         endif
"     endf
"
"     augroup vimrcEx
"         au!
"         autocmd FileType text setlocal textwidth=80
"         autocmd BufReadPost *
"                     \ if line("'\"") > 0 && line("'\"") <= line("$") |
"                     \   exe "normal g`\"" |
"                     \ endif
"     augroup END
" endif


if !exists(":AddAuthor")
  command -nargs=0  AddAuthor  :call s:Addauthor()<cr>
endif


