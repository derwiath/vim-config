if has('win32')
  let g:vim_runit_script='.vim-runit-cmd.bat'
else
  let g:vim_runit_script='.vim-runit-cmd.sh'
endif
noremap <silent> <Leader>rm :execute('RunItMake ' . g:vim_runit_script . ' make ' . expand('%:e'))<CR>
"noremap <silent> <Leader>rc :execute('RunItMake ' . g:vim_runit_script . ' make_file ' . expand('%s'))<CR>
noremap <silent> <Leader>rt :execute('RunItDispatch ' . g:vim_runit_script . ' test')<CR>
noremap <silent> <Leader>re :execute('RunItDispatch ' . g:vim_runit_script . ' extra')<CR>
"noremap <silent> <Leader>ry :execute('RunItDispatch ' . g:vim_runit_script . ' tags')<CR>
