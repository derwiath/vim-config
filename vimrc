set nocompatible

filetype off
syntax on

" Look for packages in $(current directory)/pack
let &packpath.=',' . expand('%:p:h')

" English please
set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set nowrap
set incsearch
set hlsearch
set smartindent
set gdefault
set showmatch
set autoread
set nobackup
set noswapfile
set title
set completeopt=menu,preview

color desert
if has("gui_running")
  "color desert
  set guifont=Courier:h10
  set guioptions-=T
  if exists(":winpos") == 2
    winpos 0 0
  endif
  set lines=99999 columns=999999
endif

set diffopt=filler,vertical

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]

filetype plugin on
filetype indent on

" Look for tags file upwards in directory hierarchy
set tags=./tags,tags;

" backspace in Visual mode deletes selection
vnoremap <BS> d

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

" Shortcuts
let mapleader=","

noremap <silent> <ESC> :nohlsearch<CR>
noremap <F2> ]c
noremap <S-F2> [c
noremap <F3> :lnext<CR>
noremap <S-F3> :lprev<CR>
noremap <F4> :cnext<CR>
noremap <S-F4> :cprev<CR>
noremap <C-F4> :cnfile<CR>
noremap <C-S-F4> :cpfile<CR>
noremap <C-TAB> :tabnext<CR>
noremap <C-S-TAB> :tabprev<CR>

noremap <silent> <Leader>s :source $MYVIMRC<CR>
noremap <silent> <Leader>t :exec("tjump ".expand("<cword>"))<CR>

" # Plugin package configs

" ## derwiath/vim-grepit
nnoremap <silent> <Leader>f :set operatorfunc=GrepItOperator<CR>g@
vnoremap <silent> <Leader>f :<c-u>call GrepItOperator(visualmode())<CR>
