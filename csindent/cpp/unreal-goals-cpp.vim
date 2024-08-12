" Indent C++ as GOALS likes it.
"
if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

setlocal cindent

setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4
setlocal noexpandtab

setlocal textwidth=132
setlocal nowrap
setlocal colorcolumn=133

let b:undo_indent = "setl cin<"

" C++ error format for MSVC compiler
setlocal errorformat^=%f\(%l\)%*\\W:%*\\W%t%*\\w%*\\W%m

" Unreal Header Tool errors
setlocal errorformat^=%f\(%l\)%*\\W:%*\\W%t%*\\w\:%*\\W%m
