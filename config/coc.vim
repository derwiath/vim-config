packadd coc.nvim

set nohidden
set updatetime=100  " Lower default from 4s
set shortmess+=c    " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes "Always show the signcolumn


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
	\ coc#pum#visible() ? coc#pum#next(1):
	\ <SID>check_back_space() ? "\<Tab>" :
	\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <CR> to confirm completion.
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

" Navigate diagnostics
nmap <silent> <F4> <Plug>(coc-diagnostic-next)
nmap <silent> <S-F4> <Plug>(coc-diagnostic-prev)

" GoTo code navigation.
nmap <silent> <Leader>gd <Plug>(coc-definition)
nmap <silent> <Leader>gt <Plug>(coc-type-definition)
nmap <silent> <Leader>gi <Plug>(coc-implementation)
nmap <silent> <Leader>gr <Plug>(coc-references)

" Code formatting
au FileType cs,python nnoremap <silent> <LocalLeader>b  <Plug>(coc-format-selected)
au FileType cs,python vnoremap <silent> <LocalLeader>b  <Plug>(coc-format-selected)
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use <Leader>d to show documentation in preview window.
nnoremap <silent> <Leader>d :call <SID>show_documentation()<CR>


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap keys for applying codeAction to the current buffer.
nmap <Leader>aa  <Plug>(coc-codeaction)

" Applying codeAction to the selected region.
" Example: `<Leader>aap` for current paragraph
xmap <Leader>as  <Plug>(coc-codeaction-selected)
nmap <Leader>as  <Plug>(coc-codeaction-selected)

nmap <Leader>al  <Plug>(coc-codeaction-line)

nmap <Leader>ac  <Plug>(coc-codeaction-cursor)

nmap <Leader>az  <Plug>(coc-codeaction-source)

nmap <Leader>ar  <Plug>(coc-command-repeat)

" Apply AutoFix to problem on the current line.
nmap <Leader>af  <Plug>(coc-fix-current)

" Rename symbol
nmap <Leader>ar <Plug>(coc-rename)

nnoremap <silent><nowait> <Leader>l :CocList<CR>
nnoremap <silent><nowait> <Leader>s :CocList symbols<CR>
