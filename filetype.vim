" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile .clang-format* setfiletype yaml
  au! BufRead,BufNewFile *.uproject setfiletype json
  au! BufRead,BufNewFile *.gltf setfiletype json
  au! BufRead,BufNewFile *.as set filetype=angelscript
augroup END
