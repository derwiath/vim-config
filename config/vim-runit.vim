if has('win32')
  let g:vim_runit_script='.vim-runit-cmd.bat'
else
  let g:vim_runit_script='.vim-runit-cmd.sh'
endif
noremap <silent> <Leader>m :execute('RunItMake ' . g:vim_runit_script . ' make ' . expand('%:e'))<CR>
"noremap <silent> <Leader>c :execute('RunItMake ' . g:vim_runit_script . ' make_file ' . expand('%s'))<CR>
noremap <silent> <Leader>u :execute('RunItDispatch ' . g:vim_runit_script . ' test')<CR>
noremap <silent> <Leader>x :execute('RunItDispatch ' . g:vim_runit_script . ' extra')<CR>
"noremap <silent> <Leader>y :execute('RunItDispatch ' . g:vim_runit_script . ' tags')<CR>
