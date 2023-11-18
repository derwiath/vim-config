packadd rust.vim

let g:rustfmt_autosave = 1

au FileType rust nmap <silent> <LocalLeader>m :Dispatch cargo clippy<CR>
au FileType rust nmap <silent> <LocalLeader>u :Dispatch cargo test<CR>
au FileType rust nmap <silent> <LocalLeader>b :RustFmt<CR>
au FileType rust set number
au FileType rust set colorcolumn=101
au FileType rust set fileencoding=utf-8
