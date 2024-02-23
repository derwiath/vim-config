if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

set filetype=lua

setlocal textwidth=32
setlocal noexpandtab
setlocal shiftwidth=1
setlocal tabstop=1
setlocal softtabstop=1
setlocal nowrap
setlocal colorcolumn=33
