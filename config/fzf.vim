let g:fzf_preview_window = ''
let g:fzf_history_dir = '~/temp/fzf-history'
let $FZF_DEFAULT_COMMAND='rg --files'

noremap <C-p> :Files<CR>
noremap <C-g> :Rg<CR>
