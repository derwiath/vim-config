" Vim syntax file
" Language:	AngelScript
" Maintainer:	Andreas Andersson <andreas@neoboid.com>

if exists("b:current_syntax")
  finish
endif

" Read the C++ syntax to start with
runtime! syntax/cpp.vim
unlet b:current_syntax

let b:current_syntax = "angelscript"

" vim: ts=8
