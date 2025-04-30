packadd fzf
packadd fzf.vim

let g:fzf_preview_window = ''
let g:fzf_history_dir = '~/temp/fzf-history'
let $FZF_DEFAULT_COMMAND='rg --files'
let $FZF_DEFAULT_OPTS = '--bind=ctrl-j:,ctrl-k:down,ctrl-l:up'

noremap <Leader>ff :Files<CR>
noremap <Leader>fg :Rg<CR>
