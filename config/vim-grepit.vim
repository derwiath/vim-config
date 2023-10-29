set grepprg=rg

nnoremap <silent> <Leader>f :set operatorfunc=GrepItOperator<CR>g@
vnoremap <silent> <Leader>f :<c-u>call GrepItOperator(visualmode())<CR>

let g:grepit_lang_map = {
  \ "js" : "js,ts,tsx,json" ,
  \ }
