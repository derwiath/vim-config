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

setlocal textwidth=100
setlocal colorcolumn=101

let b:undo_indent = "setl cin<"
