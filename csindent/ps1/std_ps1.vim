" Indent PowerShell in the most common way
"
if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal smartindent

setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4
setlocal expandtab

setlocal textwidth=115
setlocal nowrap
setlocal colorcolumn=116
