set nocompatible

filetype off
syntax on

let g:derwiath_vim_config=expand('<sfile>:p')
let g:derwiath_vim_config_dir=expand('<sfile>:p:h')
" Look for packages in $(current directory)/pack
let &packpath.=',' . g:derwiath_vim_config_dir
" Include $(current dir) in runtimepath
let &runtimepath=g:derwiath_vim_config_dir . ',' . &runtimepath

if has('win32')
  let &viewdir=expand('$USERPROFILE') . '\vimfiles\view'
endif

function s:SourceConfigCmd(config)
  let l:script_path=join([g:derwiath_vim_config_dir, "config", a:config . '.vim'], '/')
  if filereadable(l:script_path)
    exec "source " . l:script_path
  else
    echoerr "Failed to find: " . l:script_path
  endif
endfunction
command! -nargs=1 SourceConfig call <SID>SourceConfigCmd(<args>)

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
set nowritebackup
set title
set completeopt=menu,preview

" Fix terminal colors when using vim-deus
set t_Co=256
set termguicolors

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark
color deus
let g:deus_termcolors=256
highlight link CocInlayHint deusYellow

function! GuiTabLabel()
  return fnamemodify(bufname(winbufnr(1)), ":t")
endfunction
set guitablabel=%!GuiTabLabel()

if has("gui_running")
  set guifont=Hack:h12
  set guioptions-=T " Remove toolbar
  set guioptions-=r " Remove right scrollbar
  "if exists(":winpos") == 2
  "  winpos 0 0
  "endif
  set lines=99999 columns=999999
endif

" Neovide config
if exists("g:neovide")
  let g:neovide_cursor_animation_length = 0
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
set statusline=%t%m\ [%c,%l]\ [%{&ff}]\ %y\ [%{CodingStyleIndent()}]\ \%{fugitive#statusline()}\ [%{coc#status()}]

" Shortcuts
let mapleader=","
let maplocalleader=","

noremap <silent> <ESC> :nohlsearch<CR>
noremap <F2> ]c
noremap <S-F2> [c
noremap <F3> :lnext<CR>
noremap <S-F3> :lprev<CR>
noremap <C-M> :cnext<CR>
noremap <S-M> :cprev<CR>
noremap <C-B> :cnfile<CR>
noremap <S-B> :cpfile<CR>
noremap <Leader>w :tabnew<CR>
noremap <C-TAB> :tabnext<CR>
noremap <C-S-TAB> :tabprev<CR>

noremap <Leader>r :execute 'vertical resize ' .. (&colorcolumn + 7)<CR>
noremap <Leader>v :exec("e " . g:derwiath_vim_config)<CR>

" CTRL-C in visual mode to copy selection
vnoremap <C-C> "+y

function! s:PasteWithoutIndentCmd()
	set paste
	normal! "+p
	set nopaste
endfunction

command! -nargs=0 PasteWithoutIndent call <SID>PasteWithoutIndentCmd()
nnoremap <silent> <Leader>p :PasteWithoutIndent<CR>

noremap <silent> <Leader>t :exec("tjump ".expand("<cword>"))<CR>

" Make Enter go to current line in quickfix window
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

set grepprg=rg

SourceConfig 'vim-grepit'
SourceConfig 'vim-runit'
SourceConfig 'vim-toggleit'
SourceConfig 'vim-flipit'

" ## pico-8
" packadd pico-8.vim

" ## vim-glsl
packadd vim-glsl

SourceConfig 'fzf'
SourceConfig 'csindent'
SourceConfig 'bad-whitespace'
SourceConfig 'clang-format'
SourceConfig 'rust'
SourceConfig 'coc'
SourceConfig 'vim-dispatch'
