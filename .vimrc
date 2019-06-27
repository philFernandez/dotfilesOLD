" Preview markdown files:
" goto directory containing markdown:
" run command 'grip'
" see https://github.com/joeyespo/grip

set nocompatible
let mapleader=','

" Vim Plug {{{
call plug#begin('~/.vim/plugged')
Plug 'vimwiki/vimwiki'
Plug 'xavierd/clang_complete', { 'for':  [ 'cpp', 'c' ] }
Plug 'mattn/calendar-vim'
Plug 'svermeulen/vim-easyclip'
Plug 'lifepillar/vim-mucomplete'
Plug 'lifepillar/vim-solarized8'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'scrooloose/nerdcommenter'
Plug 'philFernandez/onehalf'
"Plug 'mengelbrecht/lightline-bufferline'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-repeat'
Plug 'christoomey/vim-tmux-navigator'
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-gitgutter'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug '/usr/local/opt/fzf/'
Plug 'w0rp/ale'
Plug 'mhinz/vim-startify'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'junegunn/fzf.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'c9s/perlomni.vim', { 'for': [ 'perl', 'perl6' ] }
Plug 'sirver/UltiSnips'
Plug 'justinmk/vim-syntax-extra', { 'for': [ 'cpp', 'c' ] }
Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
Plug 'edkolev/tmuxline.vim'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
"Plug 'philFernandez/rangerFilePicker.vim'
Plug '/Users/philthy/Source_Code/VIM/rangerFilePicker/'
Plug 'vim-python/python-syntax', { 'for': 'python' }
call plug#end()
" }}}

" UI Settings {{{
" need these for truecolor in tmux
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set showtabline=2
set background=dark
color solarized8_high
set laststatus=2
set noshowmode
set ruler
set number
set cursorline
set splitbelow
set splitright

" Cursor line insert/normal toggle
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
" }}}

" Lightline {{{
let g:lightline = {
      \ 'colorscheme': 'materia',
      \
      \   'active': {
      \     'left': [ [ 'mode', 'paste', 'spell' ],
      \               [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \   },
      \
      \   'component_function': {
      \     'gitbranch': 'fugitive#head'
      \   },
      \
      \   'tab': {
      \     'active': [ 'filename', 'modified' ],
      \     'inactive': [ 'filename', 'modified' ]
      \   },
      \
      \   'tabline': {
      \     'left': [ ['buffers'] ],
      \     'right': [ ['close', 'tabs'] ]
      \   },
      \
      \   'component_expand': {
      \     'buffers': 'lightline#bufferline#buffers'
      \   },
      \
      \   'component_type': {
      \     'buffers': 'tabsel'
      \   },
      \
      \   'separator': {
      \     'left': '',
      \     'right': ''
      \   },
      \
      \   'subseparator': {
      \     'left': '',
      \     'right': ''
      \   }
      \
      \ }
" }}}

" Tmuxline {{{
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : "#(curl 'api.openweathermap.org/data/2.5/weather?q=Stockton&appid=a21483b3b7a6dd4ce2d7627d61aebb53&units=imperial' | jq '.main.temp')",
      \'c'    : "#(neofetch uptime --uptime_shorthand tiny | awk -v OFS='\ ' '{print $2, $3, $4}')",
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'y'    : '%I:%M:%S',
      \'z'    : '%D',
      \}

let g:tmuxline_theme = {
      \   'a'    : [ 235, 41 ],
      \   'b'    : [ 41, 239 ],
      \   'c'    : [ 244, 236 ],
      \   'x'    : [ 244, 236 ],
      \   'y'    : [ 253, 239 ],
      \   'z'    : [ 235, 41 ],
      \   'win'  : [ 103, 236 ],
      \   'cwin' : [ 235, 41 ],
      \   'bg'   : [ 244, 236 ],
      \ }

" }}}

" Ultisnips {{{
let g:UltiSnipsSnippetsDir="~/.vim/ultisnips"
let g:UltiSnipsSnippetDirectories=["ultisnips"]
let g:UltiSnipsExpandTrigger="<leader>n"
" }}}

" Startify {{{
" startify settings
let g:startify_bookmarks = [
      \ '~/.vimrc',
      \ '~/.zshrc',
      \ '~/.tmux.conf',
      \ '~/.oh-my-zsh/custom/Z_aliases.zsh',
      \ '~/.oh-my-zsh/custom/myFunctions.zsh']

let g:startify_fortune_use_unicode = 0
" }}}

" Python Highlight {{{
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0
let g:python_highlight_indent_errors = 0
" }}}

" Completion {{{
" c-x c-o forces completion
set completeopt+=menuone
set completeopt+=noselect
set shortmess+=c
" automatic completion at startup (w/o this have to press tab)
let g:mucomplete#enable_auto_at_startup = 1
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Python Completion ==================================
" bring up documentation for text under cursor
let g:jedi#documentation_command = 'D'

" C Completion =======================================
let g:AutoPairsMapCR = 0
imap <expr><CR> "\<CR>\<Plug>AutoPairsReturn"
let g:clang_library_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'

" }}}

" Easy Clip and Note {{{
" EASY CLIP  =========================================
let g:EasyClipAutoFormat = 1
let g:EasyClipUseSubstituteDefaults = 1

" Note settings ====================================
let g:notes_directories = ['~/Notes/viNotes']

" }}}

" ALE {{{
let g:ale_fixers = {
      \ 'javascript': ['prettier'],
      \ 'python': ['autopep8']
      \ }

let g:ale_fix_on_save = 1

let g:ale_linters = {
      \ 'python': ['pyflakes']
      \ }
" }}}

" Indent Settings {{{

set autoindent
set expandtab
set shiftround
set shiftwidth=2
set smarttab
set tabstop=2
" }}}

" Search {{{
set hlsearch
set ignorecase
set incsearch
set smartcase
" }}}

" Text Render (wrap) {{{
set encoding=utf-8
set linebreak " dont wrap in middle of word
set nowrap
"set wrap
" }}}

" Fold {{{
" za - toggle fold under cursor
" zA - toggle fold under cursor recursively
" zR - open all folds
" zM - close all folds
" zo - unfold area under cursor
" zc - fold area under cursor
" zO - unfold recursively under cursor
" zC - fold recursively under cursor
set foldmethod=indent
set foldnestmax=3
" uncomment to disable fold on file open
set nofoldenable
" }}}

" Other VIM {{{
set mouse=a
set lazyredraw
set autoread
set backspace=indent,eol,start
set confirm
set hidden
set history=1000
set noswapfile
set autowrite
set updatetime=100
set scrolloff=3
autocmd BufRead,BufNewFile * setlocal formatoptions-=ro
" }}}

" Keymaps {{{

let g:AutoPairsShortcutToggle = '<F10>'
"copy into sys clipboard
vnoremap <silent> cp "+y
"past from sys clipboard
nnoremap <silent> cv "+p
"Disable keybindings so that we can use <leader>ca for Calendar
map <plug>DisableNERDCommenterAltDelims <plug>NERDCommenterAltDelims
map <plug>DisableCalendarH <plug>CalendarH
map <plug>DisableCalendarV <plug>CalendarV
nnoremap <silent> <leader>ca :Calendar<cr>
inoremap jj <Esc>
nnoremap gm m
nnoremap <silent> <c-s> :Startify<CR>
nnoremap <silent> <leader>cd :cd %:p:h<cr>
nnoremap <silent> <leader>nh :GitGutterNextHunk<cr>
nnoremap <silent> <leader>ph :GitGutterPrevHunk<cr>
nnoremap <silent> <leader>rn :set relativenumber!<cr>
nnoremap <silent> <leader>n :set number!<cr>
nnoremap <silent> <leader>s :set spell!<cr>
nnoremap sa ggVG
nnoremap <silent> bn :bnext<cr>
nnoremap <silent> bp :bNext<cr>
nnoremap <silent> bc :bdelete!<cr>
nnoremap <silent> <leader><space> :nohl<cr>
nnoremap J }
nnoremap K {
nnoremap q :q<cr>
nnoremap <silent> cc :clo<cr>
nnoremap <space> A
nnoremap <silent> <leader>l :Buffers<CR>
nnoremap <silent> <leader>m :pclose<cr>
nnoremap <c-p> :Files<cr>

" resize splits
nnoremap <silent> <F5> :resize +2<cr>
nnoremap <silent> <F6> :resize -2<cr>
nnoremap <silent> <F7> :vertical resize +2<cr>
nnoremap <silent> <F8> :vertical resize -2<cr>

fun DoubleQuoteLine()
  exe 'normal! 0v$di""'
  exe 'normal! hp'
endfun
nnoremap <leader>ql :call DoubleQuoteLine()<cr>

fun DoubleQuoteWord()
  "exe 'normal! viwdi""'
  exe 'normal! BvEdi""'
  exe 'normal! hp'
endfun
nnoremap <leader>qw :call DoubleQuoteWord()<cr>

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], [preview window], [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Bat: https://github.com/sharkdp/bat
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview('up:60%')
      \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
      \                 <bang>0)
" }}}

" Custom Syntax (Inactive) {{{

"custom syntax settings
"syntax bolding
"hi Question cterm=bold
"hi WarningMsg cterm=bold
"hi Statement cterm=bold
"hi PreProc cterm=bold
"hi Type cterm=bold
"hi Conditional cterm=bold
"hi Keyword cterm=bold
"hi Exception cterm=bold
"hi PreCondit cterm=bold
"hi StorageClass cterm=bold
"hi Structure cterm=bold
"hi Typedef cterm=bold
"hi cssClassName cterm=bold
"hi jsFunction cterm=bold
"hi Function cterm=bold
"hi Repeat cterm=bold
"hi jsReturn cterm=bold
" }}}

" vim:foldmethod=marker:foldlevel=0:foldenable
