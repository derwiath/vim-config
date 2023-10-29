" Fix terminal colors when using vim-deus
set t_Co=256
set termguicolors

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark
color deus
let g:deus_termcolors=256

highlight link CocInlayHint deusYellow

