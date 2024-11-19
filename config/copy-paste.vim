function! s:PasteWithoutIndentCmd()
	set paste
	normal! "+p
	set nopaste
endfunction

command! -nargs=0 PasteWithoutIndent call <SID>PasteWithoutIndentCmd()
nnoremap <silent> <Leader>p :PasteWithoutIndent<CR>

" CTRL-C in visual mode to copy selection
vnoremap <C-C> "+y

" Copy current filename with path to clipboard
nnoremap <silent> <Leader>c :let @* = expand("%:p")<CR>
