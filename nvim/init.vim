source $HOME/github.com/derwiath/vim-config/vimrc

" clang-format config
if has("macunix")
  let s:llvm_root_path='/Users/andreas/LLVM/current'
else
  let s:llvm_root_path='C:/Program Files/LLVM'
endif
let g:clang_format_script = s:llvm_root_path . '/share/clang/clang-format.py'

let g:neovide_scroll_animation_length = 0
