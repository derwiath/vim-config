if has("gui_running")

  if has("win32") || has("win64")
    set guifont=Hack:h12
  else
    set guifont=Hack:h13
  endif

  set guioptions-=T " Remove toolbar
  set guioptions-=r " Remove right scrollbar
"  if exists(":winpos") == 2
"    winpos 0 0
"  endif
  if !exists("g:neovide")
    set lines=99999 columns=999999
  endif
endif

function! GuiTabLabel()
  return fnamemodify(bufname(winbufnr(1)), ":t")
endfunction
set guitablabel=%!GuiTabLabel()


" Neovide config
if exists("g:neovide")
  let g:neovide_cursor_animation_length = 0
endif
