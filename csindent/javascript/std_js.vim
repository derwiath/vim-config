if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal cindent

setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2
setlocal expandtab

setlocal textwidth=100
setlocal nowrap
setlocal colorcolumn=101
