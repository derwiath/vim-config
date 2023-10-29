" Configure statusline
set laststatus=2 " Enables the status line at the bottom of Vim
" [filename][modified] [column,line] [fileformat] [filetype] [csindent] [git-branch]
set statusline=%t%m\ [%c,%l]\ [%{&ff}]\ %y\ [%{CodingStyleIndent()}]\ \%{fugitive#statusline()}\ [%{coc#status()}]
