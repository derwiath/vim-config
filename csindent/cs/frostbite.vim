if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

setlocal cindent

setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4
setlocal noexpandtab
setlocal nowrap

setlocal textwidth=100
setlocal colorcolumn=101
setlocal fileformat=dos

let b:undo_indent = "setl cin<"
