set nocompatible

let g:derwiath_vim_config=expand('<sfile>:p')
let g:derwiath_vim_config_dir=expand('<sfile>:p:h')
" Look for packages in $(current directory)/pack
let &packpath.=',' . g:derwiath_vim_config_dir
" Include $(current dir) in runtimepath
let &runtimepath=g:derwiath_vim_config_dir . ',' . &runtimepath

if has('win32')
  let &viewdir=expand('$USERPROFILE') . '\vimfiles\view'
 let g:python3_host_prog=expand('$USERPROFILE') . '\AppData\Local\Programs\Python\Python312\python.exe'
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
set langmenu=en_us
let $LANG = 'en_us.utf8'
let $LC_ALL= 'en_us.utf8'
let $LC_CTYPE= '.utf8'
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

set diffopt=filler,vertical

filetype on
filetype plugin on
filetype indent on
syntax on

" Shortcuts
let mapleader=","
let maplocalleader=","

noremap <Leader>r :execute 'vertical resize ' .. (&colorcolumn + 7)<CR>
noremap <Leader>v :exec("e " . g:derwiath_vim_config)<CR>

if has("gui_running")
  SourceConfig 'gui'
endif
SourceConfig 'color'

SourceConfig 'copy-paste'
SourceConfig 'movement'
SourceConfig 'statusline'

SourceConfig 'vim-grepit'
SourceConfig 'vim-runit'
SourceConfig 'vim-toggleit'
SourceConfig 'vim-flipit'

SourceConfig 'pico-8'
SourceConfig 'fzf'
SourceConfig 'csindent'
SourceConfig 'bad-whitespace'
SourceConfig 'clang-format'
SourceConfig 'rust'
SourceConfig 'coc'
SourceConfig 'python'
SourceConfig 'vim-dispatch'
SourceConfig 'vim-svelte-plugin'
"SourceConfig 'vim-svelte'
SourceConfig 'context_filetype'
SourceConfig 'prettier'

SourceConfig 'vim-perforce'



" ## vim-glsl
"packadd vim-glsl
