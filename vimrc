set nocompatible

filetype off
syntax on

let g:derwiath_vim_config_dir=expand('<sfile>:p:h')
" Look for packages in $(current directory)/pack
let &packpath.=',' . g:derwiath_vim_config_dir
" Include $(current dir) in runtimepath
let &runtimepath=g:derwiath_vim_config_dir . ',' . &runtimepath

if has('win32')
  let &viewdir=expand('$USERPROFILE') . '\vimfiles\view'
endif

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

function! GuiTabLabel()
  return fnamemodify(bufname(winbufnr(1)), ":t")
endfunction
set guitablabel=%!GuiTabLabel()

if has("gui_running")
  set guifont=Hack:h12
  set guioptions-=T " Remove toolbar
  set guioptions-=r " Remove right scrollbar
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

" CTRL-C in visual mode to copy selection
vnoremap <C-C> "+y
" CTRL-V in normal mode to paste (after cursor)
"nnoremap <C-V> "+gp

noremap <silent> <Leader>t :exec("tjump ".expand("<cword>"))<CR>

" # Plugin package configs

" ## derwiath/vim-grepit
nnoremap <silent> <Leader>f :set operatorfunc=GrepItOperator<CR>g@
vnoremap <silent> <Leader>f :<c-u>call GrepItOperator(visualmode())<CR>
let g:grepit_lang_map = {
  \ "js" : "js,ts,tsx,json" ,
  \ }

" ## derwiath/vim-runit
if has('win32')
  let g:vim_runit_script='.vim-runit-cmd.bat'
else
  let g:vim_runit_script='.vim-runit-cmd.sh'
endif
noremap <silent> <Leader>m :execute('RunItMake ' . g:vim_runit_script . ' make')<CR>
noremap <silent> <Leader>c :execute('RunItMake ' . g:vim_runit_script . ' make_file ' . expand('%s'))<CR>
noremap <silent> <Leader>u :execute('RunItDispatch ' . g:vim_runit_script . ' test')<CR>
noremap <silent> <Leader>x :execute('RunItDispatch ' . g:vim_runit_script . ' extra')<CR>
noremap <silent> <Leader>y :execute('RunItDispatch ' . g:vim_runit_script . ' tags')<CR>
noremap <silent> <Leader>e :execute('RunItDispatch ' . g:vim_runit_script . ' editor')<CR>

" ## derwiath/vim-toggleit
noremap <silent> <Leader>n :ToggleItNumber<CR>
noremap <silent> <Leader>q :ToggleItQuickfix<CR>

" Make Enter go to current line in quickfix window
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" Configure fzf
packadd fzf
packadd fzf.vim
let g:fzf_preview_window = ''
let g:fzf_history_dir = '~/temp/fzf-history'
let $FZF_DEFAULT_COMMAND='rg --files'

noremap <C-p> :Files<CR>
noremap <C-g> :Rg<CR>

" ## csindent
let g:csindent_ini = join([g:derwiath_vim_config_dir, 'vim_csindent.ini'], '/')

" Configure bad-whitespace
noremap <silent> <Leader><Space> :EraseBadWhitespace<CR>
highlight default BadWhitespace ctermbg=red guibg=darkgrey
highlight ColorColumn ctermbg=red guibg=darkgrey

" clang-format
function! s:GetParentDirectory(filename)
  let l:filename_with_fwd_slash = substitute(a:filename, '\\', '/', 'g')
  let l:parts = split(l:filename_with_fwd_slash, '\/')
  return join(l:parts[0:-2], '/')
endfunction

function! s:GetClangFormatOverride(basename)
  let l:current_file_dir = expand('<cfile>:p:h')
  let l:clang_format_path_file = findfile(a:basename, l:current_file_dir . ';')
  if l:clang_format_path_file == ''
    return ''
  endif

  let l:content = readfile(l:clang_format_path_file)
  let l:override = json_decode(l:content)
  if !has_key(l:override, 'path')
    echo 'Warning: failed to find "path" key in ' . l:clang_format_path_file
    return ''
  endif
  let l:clang_format_path = substitute(l:override['path'], '\\', '/', 'g')
  let l:full_path = exepath(l:clang_format_path)
  if l:full_path != ''
    return l:full_path
  endif

  let l:clang_format_path_dir = s:GetParentDirectory(l:clang_format_path_file)
  let l:full_path = exepath(l:clang_format_path_dir . '/' . l:clang_format_path)
  if l:full_path != ''
    return l:full_path
  endif

  echoerr 'Failed to find ' . l:clang_format_path . ' '
  return ''
endfunction

function! s:ClangFormatCmd() range
  if !exists('g:clang_format_script')
    echoerr 'Please define g:clang_format_script with full path to clang-format.py'
    return
  endif

  if has('python3')
    let l:python_cmd = 'py3file'
  elseif has('python')
    let l:python_cmd = 'pyfile'
  else
    echoerr 'Missing python integration, can not run clang-format'
    return
  endif

  let l:clang_format_path = s:GetClangFormatOverride('.clang-format-override.json')
  if l:clang_format_path != ''
    if exists('g:clang_format_path')
      let l:old_clang_format_path = g:clang_format_path
    endif
    let g:clang_format_path = l:clang_format_path
  endif

  silent execute l:python_cmd . ' ' . ' ' . g:clang_format_script

  if l:clang_format_path != ''
    if exists('l:old_clang_format_path')
      let g:clang_format_path = l:old_clang_format_path
    else
      unlet g:clang_format_path
    endif
  endif

endfunction

command! -nargs=0 -range ClangFormat call <SID>ClangFormatCmd()
au FileType cpp noremap <silent> <LocalLeader>b :ClangFormat<CR>

" Rust
let g:rustfmt_autosave = 1
au FileType rust nmap <silent> <LocalLeader>m :Dispatch cargo build<CR>
au FileType rust nmap <silent> <LocalLeader>u :Dispatch cargo test<CR>
au FileType rust nmap <silent> <LocalLeader>b :RustFmt<CR>
au FileType rust set number
au FileType rust set colorcolumn=100
au FileType rust set fileencoding=utf-8

" Configure CoC
" =============
packadd coc.nvim

set nohidden
set updatetime=100  " Lower default from 4s
set shortmess+=c    " Don't pass messages to |ins-completion-menu|.
set signcolumn=number " Always show the signcolumn

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <CR> to confirm completion, `<C-g>u` means break undo chain at current
" position. CoC only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Navigate diagnostics
nmap <silent> <F4> <Plug>(coc-diagnostic-next)
nmap <silent> <S-F4> <Plug>(coc-diagnostic-prev)

" GoTo code navigation.
nmap <silent> <Leader>gd <Plug>(coc-definition)
nmap <silent> <Leader>gt <Plug>(coc-type-definition)
nmap <silent> <Leader>gi <Plug>(coc-implementation)
nmap <silent> <Leader>gr <Plug>(coc-references)

" Code formatting
au FileType cs,python nmap <silent> <LocalLeader>b  <Plug>(coc-format-selected)
au FileType cs,python vmap <silent> <LocalLeader>b  <Plug>(coc-format-selected)

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

" Applying codeAction to the selected region.
" Example: `<Leader>aap` for current paragraph
xmap <Leader>a  <Plug>(coc-codeaction-selected)
nmap <Leader>a  <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <Leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <Leader>af  <Plug>(coc-fix-current)

nnoremap <silent><nowait> <Leader>l :CocList<CR>
nnoremap <silent><nowait> <Leader>s :CocList symbols<CR>

" =============
" Configure CoC end

" Config vim-dispatch to prioritize iTerm
let g:dispatch_handlers = ['iterm', 'tmux', 'job', 'screen', 'windows', 'x11', 'headless',]
