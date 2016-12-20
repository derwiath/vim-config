:%" Vim indent file
if exists("b:did_indent")
    finish
endif
let b:did_intent = 1


setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4
setlocal noexpandtab

setlocal textwidth=120
setlocal nowrap
set colorcolumn=121

setlocal cindent
setlocal cinoptions=h1,l1,g1,t0,i4,+4,(0,w1,W4

let b:undo_indent = "setl sw< ts< sts< et< tw< wrap< cin< cino< inde<"

