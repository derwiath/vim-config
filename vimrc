set nocompatible

filetype off
syntax on

let g:derwiath_vim_config_dir=expand('<sfile>:p:h')
" Look for packages in $(current directory)/pack
let &packpath.=',' . g:derwiath_vim_config_dir
" Include $(current dir) in runtimepath
let &runtimepath=g:derwiath_vim_config_dir . ',' . &runtimepath

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

" Configure statusline
set laststatus=2 " Enables the status line at the bottom of Vim
" [filename][modified] [column,line] [fileformat] [filetype] [csindent] [git-branch]
set statusline=%t%m\ [%c,%l]\ [%{&ff}]\ %y\ [%{CodingStyleIndent()}]\ \%{fugitive#statusline()}

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

" ## derwiath/vim-runit
let s:vim_runit_script='.vim-runit-cmd.sh'
noremap <silent> <Leader>m :execute('RunItMake ' . s:vim_runit_script . ' make')<CR>
noremap <silent> <Leader>c :execute('RunItMake ' . s:vim_runit_script . ' make_file ' . expand('%s'))<CR>
noremap <silent> <Leader>u :execute('RunItDispatch ' . s:vim_runit_script . ' test')<CR>
noremap <silent> <Leader>x :execute('RunItDispatch ' . s:vim_runit_script . ' extra')<CR>
noremap <silent> <Leader>y :execute('RunItDispatch ' . s:vim_runit_script . ' tags')<CR>

" ## derwiath/vim-toggleit
noremap <silent> <Leader>n :ToggleItNumber<CR>
noremap <silent> <Leader>q :ToggleItQuickfix<CR>

" Configure CtrlP
"set wildignore=*.meta
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|build\|ninja-build\|target\|tundra-output\|t2-output\|\<\w*\>.xcodeproj\|node_modules',
  \ 'file': '\v\.(exe|so|dll|tundra.*|swp|meta|class|pyc)$',
  \ }
"let g:ctrlp_jump_to_buffer = 0
let g:ctrlp_working_path_mode = 0

" Configure bad-whitespace
noremap <silent> <Leader><Space> :EraseBadWhitespace<CR>
highlight default BadWhitespace ctermbg=red guibg=darkgrey
highlight ColorColumn ctermbg=red guibg=darkgrey

" Configure A
noremap <silent> <Leader>h :A<CR>
let g:alternateExtensions_cpp = "h,inl"
let g:alternateExtensions_inl = "cpp,h"
let g:alternateExtensions_h = "inl,cpp,m,mm,cc"
let g:alternateExtensions_cc = "h,inl"
let g:alternateExtensions_m = "h"
let g:alternateExtensions_mm = "h"
let g:alternateNoDefaultAlternate = 1
