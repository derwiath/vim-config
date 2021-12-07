" Indent C++ as Unreal likes it.
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

setlocal textwidth=130
setlocal nowrap
setlocal colorcolumn=131

let b:undo_indent = "setl cin<"
