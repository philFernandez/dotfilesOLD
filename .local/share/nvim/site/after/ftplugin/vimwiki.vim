set tw=95
set nonumber
set concealcursor=n
set nocursorline

" Make paste not use auto-format
map p <leader>p

command! W silent! :w|Vimwiki2HTML
command! Wa silent! :wa|VimwikiAll2HTML
command! Wb silent! :wa|Vimwiki2HTMLBrowse

"nnoremap <c-b><c-b> :!pandoc % --to=html5 > ~/Notes/Vimwiki_html/%:t:r.html<CR>
