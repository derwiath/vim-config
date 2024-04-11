if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

setlocal cindent

setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4
setlocal expandtab

setlocal nowrap
setlocal textwidth=120
setlocal colorcolumn=121

let b:undo_indent = "setl cin<"

" C++ error format for MSVC compiler
setlocal errorformat^=%f\(%l\)%*\\W:%*\\W%t%*\\w%*\\W%m

" Unreal Header Tool errors
setlocal errorformat^=%f\(%l\)%*\\W:%*\\W%t%*\\w\:%*\\W%m
