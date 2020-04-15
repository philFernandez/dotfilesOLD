set tw=0
set nonumber
set concealcursor=n
set nocursorline

" Make paste not use auto-format
map P <leader>P
map p <leader>p
map 8 @a
map 9 3ggfSciw<Esc>CV
nnoremap <silent> <leader>l :Tags<CR>

command! W silent! :w|Vimwiki2HTML
command! Wa silent! :wa|VimwikiAll2HTML
command! Wb silent! :wa|Vimwiki2HTMLBrowse

"nnoremap <c-b><c-b> :!pandoc % --to=html5 > ~/Notes/Vimwiki_html/%:t:r.html<CR>
