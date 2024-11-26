" clang-format
function! s:GetParentDirectory(filename)
  let l:filename_with_fwd_slash = substitute(a:filename, '\\', '/', 'g')
  let l:parts = split(l:filename_with_fwd_slash, '\/')
  return join(l:parts[0:-2], '/')
endfunction

function! s:GetClangFormatOverride(basename)
  let l:current_file_dir = expand('%:p:h')
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

function! s:ClangFormatLines(lines)
  if !exists('g:clang_format_script')
    echoerr 'Please define g:clang_format_script with full path to clang-format.py'
    return
  endif

  if g:python3_host_prog != ''
    let l:python_cmd = 'pyfile'
  elseif has('python3')
    let l:python_cmd = 'pyfile'
  else
    echoerr 'Missing python integration, can not run clang-format'
    return
  endif

  let l:clang_format_path = s:GetClangFormatOverride('.clang-format-override.json')
  if l:clang_format_path != ''
    if !filereadable(l:clang_format_path)
      echoerr 'Speficied clang-format path does not exist: ' . l:clang_format_path
      return
    endif
    if exists('g:clang_format_path')
      let l:old_clang_format_path = g:clang_format_path
    endif
    let g:clang_format_path = l:clang_format_path
  endif

  let l:lines = a:lines
  silent execute l:python_cmd . ' ' . ' ' . g:clang_format_script

  if l:clang_format_path != ''
    if exists('l:old_clang_format_path')
      let g:clang_format_path = l:old_clang_format_path
    else
      unlet g:clang_format_path
    endif
  endif
endfunction

function! s:ClangFormatCmd()
  let l:currentline=line('.')
  let l:lines=l:currentline . ':' . l:currentline
  call s:ClangFormatLines(l:lines)
endf

function! s:ClangFormatRangeCmd() range
  let l:lines=a:firstline . ':' . a:lastline
  call s:ClangFormatLines(l:lines)
endfunction

command! -nargs=0 ClangFormat call <SID>ClangFormatCmd()
command! -nargs=0 -range ClangFormatRange '<,'>call <SID>ClangFormatRangeCmd()
au FileType cpp nnoremap <silent> <Leader>b :ClangFormat<CR>
au FileType cpp vnoremap <silent> <Leader>b :'<,'>ClangFormatRange<CR>

au FileType angelscript vnoremap <silent> <Leader>b :'<,'>ClangFormatRange<CR>
