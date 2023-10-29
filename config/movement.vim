" Tags
noremap <silent> <Leader>t :exec("tjump ".expand("<cword>"))<CR>

" Look for tags file upwards in directory hierarchy
set tags=./tags,tags;

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

noremap <silent> <ESC> :nohlsearch<CR>

" Next/Prev Diff
noremap <F2> ]c
noremap <S-F2> [c

" Quickfix movement
noremap <F3> :lnext<CR>
noremap <S-F3> :lprev<CR>
noremap <C-M> :cnext<CR>
noremap <S-M> :cprev<CR>
noremap <C-B> :cnfile<CR>
noremap <S-B> :cpfile<CR>

" Make Enter go to current line in quickfix window
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" Tabs
noremap <Leader>w :tabnew<CR>
noremap <C-TAB> :tabnext<CR>
noremap <C-S-TAB> :tabprev<CR>

" Backspace
" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]
" backspace in Visual mode deletes selection
vnoremap <BS> d

