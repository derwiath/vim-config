" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.hql setfiletype hive
  au! BufRead,BufNewFile .clang-format* setfiletype yaml
  au! BufRead,BufNewFile *.uproject setfiletype json
  au! BufRead,BufNewFile *.p8 setfiletype lua
augroup END
