" Standard tab based indentation for xml
"
if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4
setlocal noexpandtab

setlocal nowrap
