" Tags
noremap <silent> <Leader>t :exec("tjump ".expand("<cword>"))<CR>

" Look for tags file upwards in directory hierarchy
set tags=./tags,tags;

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

" Home row remapping script with toggle between ';' and 'ö'
if !exists('g:home_row_layout')
  let g:home_row_layout = 'swedish' " or 'us'
endif

let s:current_layout = g:home_row_layout

function! s:RemapHomeRow()
  let l:mappings = [
        \ ['j', 'h'],
        \ ['k', 'j'],
        \ ['l', 'k'],
        \ [s:current_layout ==# 'swedish' ? 'ö' : ';', 'l']
        \ ]

  let l:modes = ['n', 'v', 'o']

  if s:current_layout ==# 'swedish'
    let l:unmap_key = ';'
  else
    let l:unmap_key = 'ö'
  endif

  for mode in l:modes
    execute mode . 'unmap ' . l:unmap_key
  endfor

  for mode in l:modes
    for [from, to] in l:mappings
      execute mode . 'noremap ' . from . ' ' . to
    endfor
  endfor

  " Easy window navigation
  for [from, to] in l:mappings
    execute 'map' . '<C-' . from . '> <C-w>' . to
  endfor

endfunction

function! s:ToggleHomeRowLayout()
  if s:current_layout ==# 'swedish'
    let s:current_layout = 'us'
  else
    let s:current_layout = 'swedish'
  endif
  call s:RemapHomeRow()
  echo "Home row layout toggled to: " . s:current_layout
endfunction

" Create a user command for toggling
command! ToggleHomeRow call <SID>ToggleHomeRowLayout()

nnoremap <silent> <Leader>k :ToggleHomeRow<CR>

silent! call <SID>RemapHomeRow()
