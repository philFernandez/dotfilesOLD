
" need to be first {{{1
set nocompatible
let mapleader=','

" Vim Plug {{{1
call plug#begin('~/.vim/plugged')
Plug 'xavierd/clang_complete', { 'for':  [ 'cpp', 'c' ] }
Plug 'sheerun/vim-polyglot'
Plug 'mattn/calendar-vim'
Plug 'svermeulen/vim-easyclip'
Plug 'lifepillar/vim-mucomplete'
Plug 'scrooloose/nerdcommenter'
Plug 'philFernandez/onehalf'
Plug 'chiel92/vim-autoformat'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/vim-gitbranch'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-repeat'
Plug 'machakann/vim-highlightedyank'
Plug 'mhinz/vim-signify'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug '/usr/local/opt/fzf/'
Plug 'dense-analysis/ale'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'justinmk/vim-syntax-extra', { 'for': [ 'cpp', 'c' ] }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-surround'
Plug 'PProvost/vim-ps1'
Plug 'vim-scripts/taglist.vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'majutsushi/tagbar'

" Un-used plugins {{{1
"Plug 'airblade/vim-gitgutter'
"Plug 'christoomey/vim-tmux-navigator'
"Plug 'c9s/perlomni.vim', { 'for': [ 'perl', 'perl6' ] }
"Plug 'davidhalter/jedi-vim', { 'for': 'python' }
"Plug 'sirver/UltiSnips'
"Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
"Plug 'edkolev/tmuxline.vim'
"Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
"Plug 'vim-python/python-syntax', { 'for': 'python' }
"Plug 'tmux-plugins/vim-tmux-focus-events'
"Plug 'mattn/emmet-vim', { 'for': 'html' }
call plug#end()

" UI Settings {{{1
" need these for truecolor in tmux
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"set termguicolors
set showtabline=2
set background=dark
"color onehalfdark
"color materialbox
color OceanicNext
let g:oceanic_next_terminal_bold=1
let g:oceanic_next_terminal_italic=1
set laststatus=2
set noshowmode
set ruler
set number
set splitbelow
set splitright
set termguicolors

hi ALEWarning guibg=NONE guifg=NONE

" Cursor line insert/normal toggle
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

" Other VIM {{{1
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
set wildmenu
set tags=./.git/tags;
set path+=/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/include
set path+=/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/Kernel.framework/Versions/A/Headers

if !isdirectory("/tmp/.vim-undo-dir")
	call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile
"au BufWrite *.c,*.py,*.java :Autoformat

" keep window position static when switching between buffers
au BufLeave * let b:winview = winsaveview()
au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
" --------------------------------------------------------------------------
"
" No automatic comments on next line
"autocmd BufRead,BufNewFile * setlocal formatoptions-=ro
autocmd FileType vim,zsh,bash,sh,python setlocal formatoptions-=ro
au BufWrite * :RemoveTrailingSpaces

" Indent Settings {{{1
set autoindent
set expandtab " use spaces instead of tabs
set shiftround
set shiftwidth=2
set smarttab
set tabstop=2

" Search {{{1
set hlsearch
set ignorecase
set incsearch
set smartcase

" Text Render (wrap) {{{1
set encoding=utf-8
set linebreak " dont wrap in middle of word
set nowrap
" for latex, or paragraph type writing
"set formatoptions+=a
"set wrap

" Fold {{{1
" za - toggle fold under cursor
" zA - toggle fold under cursor recursively
" zR - open all folds
" zM - close all folds
" zo - unfold area under cursor
" zc - fold area under cursor
" zO - unfold recursively under cursor
" zC - fold recursively under cursor
" zj - jump down to next fold
" zk - jump up to previous fold
set foldmethod=indent
set foldnestmax=3
" uncomment to disable fold on file open
set nofoldenable

" Lightline {{{1
let g:lightline = {
      \ 'colorscheme': 'materia',
      \
      \   'active': {
      \     'left': [ [ 'mode', 'paste', 'spell' ],
      \               [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \   },
      \
      \   'component_function': {
      \     'gitbranch': 'gitbranch#name'
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
      \     'left': '',
      \     'right': ''
      \   },
      \
      \   'subseparator': {
      \     'left': '',
      \     'right': ''
      \   }
      \
      \ }

" Tmuxline {{{1
"let g:tmuxline_preset = {
      "\'a'    : '#S',
      "\'b'    : "#(curl 'api.openweathermap.org/data/2.5/weather?q=Stockton&appid=a21483b3b7a6dd4ce2d7627d61aebb53&units=imperial' | jq '.main.temp')",
      "\'c'    : "#(neofetch uptime --uptime_shorthand tiny | awk -v OFS='\ ' '{print $2, $3, $4}')",
      "\'win'  : '#I #W',
      "\'cwin' : '#I #W',
      "\'y'    : '%I:%M:%S',
      "\'z'    : '%D',
      "\}

"let g:tmuxline_theme = {
      "\   'a'    : [ 235, 41 ],
      "\   'b'    : [ 41, 239 ],
      "\   'c'    : [ 244, 236 ],
      "\   'x'    : [ 244, 236 ],
      "\   'y'    : [ 253, 239 ],
      "\   'z'    : [ 235, 41 ],
      "\   'win'  : [ 103, 236 ],
      "\   'cwin' : [ 235, 41 ],
      "\   'bg'   : [ 244, 236 ],
      "\ }

" Ultisnips {{{1
"let g:UltiSnipsSnippetsDir="~/.vim/ultisnips"
"let g:UltiSnipsSnippetDirectories=["ultisnips"]
"let g:UltiSnipsExpandTrigger="<leader>n"

" Startify {{{1
let g:startify_bookmarks = [
      \ '~/.vimrc',
      \ '~/.zshrc',
      \ '~/.oh-my-zsh/custom/Z_aliases.zsh',
      \ '~/.oh-my-zsh/custom/myFunctions.zsh']
let g:startify_fortune_use_unicode = 0
" When adding/removing files from session
" automatically make saved session reflect
" changes
let g:startify_session_persistence = 1

" Python Highlight {{{1
"let g:python_highlight_all = 1
"let g:python_highlight_space_errors = 0
"let g:python_highlight_indent_errors = 0

" Completion {{{1
 "c-x c-o forces completion
set completeopt+=menuone
set completeopt+=noselect
set completeopt-=preview
set shortmess+=c
" utomatic completion at startup (w/o this have to press tab)
let g:mucomplete#enable_auto_at_startup = 1
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Python Completion ==================================
" bring up documentation for text under cursor
"let g:jedi#documentation_command = 'D'

" C Completion =======================================
let g:clang_make_default_keymappings=0
let g:AutoPairsMapCR = 0
imap <expr><CR> "\<CR>\<Plug>AutoPairsReturn"
let g:clang_library_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'


" Easy Clip and Note {{{1
" EASY CLIP  =========================================
let g:EasyClipAutoFormat = 1
let g:EasyClipUseSubstituteDefaults = 1

" Note settings ====================================
let g:notes_directories = ['~/Notes/viNotes']

" ALE {{{1
"let g:ale_fixers = {
      "\ 'javascript': ['prettier'],
      "\ 'python': ['autopep8']
      "\ }

"let g:ale_fix_on_save = 1

"let g:ale_linters = {
      "\ 'python': ['pyflakes']
      "\ }
"let g:ale_pattern_options = {
      "\ '.*\.java$': {'ale_enabled': 0},
      "\ }

" Keymaps {{{1

map <silent><c-t> :TagbarToggle<CR>
nnoremap <leader>f :NERDTreeToggle<CR>

" Delete contents of line w/o removing the line itself
nnoremap dl I<Esc>d$

" Turn off number inc/dec
"map <C-A> <Nop>
"map <C-X> <Nop>
"=======================

" pane navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

tnoremap <c-n> <c-\><c-n>

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
map q :q<cr>
vnoremap q :q<cr>
nnoremap <silent> cc :clo<cr>
nnoremap <space> A
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

"function! s:buflist()
  "redir => ls
  "silent ls
  "redir END
  "return split(ls, '\n')
"endfunction

"function! s:bufopen(e)
  "execute 'buffer' matchstr(a:e, '^[ 0-9]*')
"endfunction

"nnoremap <silent> <leader>l :call fzf#run({
      "\   'source':  reverse(<sid>buflist()),
      "\   'sink':    function('<sid>bufopen'),
      "\   'options': '+m',
      "\   'down':    len(<sid>buflist()) + 2
      "\ })<CR>

" How to open buffers
" ctrl-v = vertical split
" ctrl-x = split
" ctrl-t = tab
nnoremap <silent> <leader>l :Buffers<CR>

" Custom Syntax (Inactive) {{{1
let java_highlight_functions = 1
let java_highlight_all = 1
" If you are trying this at runtime, you need to reload the syntax file

" Some more highlights, in addition to those suggested by cmcginty
highlight link javaScopeDecl Statement
highlight link javaType Type
highlight link javaDocTags PreProc
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

" NOTES {{{1

" Preview markdown files:
" goto directory containing markdown:
" run command 'grip'
" see https://github.com/joeyespo/grip

" vim:foldenable foldmethod=marker foldcolumn=1
