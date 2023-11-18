function! FormatAndSave()
    " Run the formatting command
    CocCommand prettier.forceFormatDocument

    " Delay to ensure the buffer is updated
    sleep 200m

    " Write the buffer to disk
    write
endfunction

command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.svelte call FormatAndSave()
