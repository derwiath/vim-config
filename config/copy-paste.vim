function! s:PasteWithoutIndentCmd()
	set paste
	normal! "+p
	set nopaste
endfunction

command! -nargs=0 PasteWithoutIndent call <SID>PasteWithoutIndentCmd()
nnoremap <silent> <Leader>p :PasteWithoutIndent<CR>
vnoremap <Leader>c "+y

" CTRL-C or visual mode to copy selection
if has("win32") || has("win64")
  vnoremap <C-c> "+y
endif

" Copy current filename with path to clipboard
nnoremap <silent> <Leader>c :let @* = expand("%:p")<CR>
