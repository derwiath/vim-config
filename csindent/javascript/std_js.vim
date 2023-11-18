if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal cindent

setlocal shiftwidth=2
setlocal tabstop=4
setlocal softtabstop=4
setlocal expandtab

setlocal textwidth=100
setlocal nowrap
setlocal colorcolumn=101
