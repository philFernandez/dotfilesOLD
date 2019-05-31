" Ranger for VIM
" https://github.com/rafaqz/ranger.vim
let mapleader=','
syntax on
set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'
Plug 'svermeulen/vim-easyclip'
Plug 'lifepillar/vim-mucomplete'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'philFernandez/onehalf'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-repeat'
Plug 'Chiel92/vim-autoformat'
Plug 'christoomey/vim-tmux-navigator'
Plug 'machakann/vim-highlightedyank'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'vim-scripts/dbext.vim'
Plug 'ryanoasis/vim-devicons'
Plug '/usr/local/opt/fzf/'
Plug 'w0rp/ale'
Plug 'davidhalter/jedi-vim'
Plug 'junegunn/fzf.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'c9s/perlomni.vim'
Plug 'sirver/UltiSnips'
call plug#end()

set showtabline=2
set background=dark
color palenight

let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night',
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

let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline#bufferline#filename_modifier = ':t'

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

let g:UltiSnipsSnippetsDir="~/.vim/ultisnips"
let g:UltiSnipsSnippetDirectories=["ultisnips"]

" Completion Settings =============================
" c-x c-o forces completion
set completeopt+=menuone
set completeopt+=noselect
set shortmess+=c
" automatic completion at startup (w/o this have to press tab)
let g:mucomplete#enable_auto_at_startup = 1
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" EASY CLIP  =========================================
let g:EasyClipAutoFormat = 1
let g:EasyClipUseSubstituteDefaults = 1

" Note settings ====================================
let g:notes_directories = ['~/Notes/viNotes']
"let g:notes_suffix = '.txt'

" VIM SETTINGS =========================
set autoindent
set expandtab
set shiftround
set shiftwidth=2
set smarttab
set tabstop=2

"search settings
set hlsearch
set ignorecase
set incsearch
set smartcase

" text rendering settings
set encoding=utf-8
set linebreak " dont wrap in middle of word
set nowrap
"set wrap

set laststatus=2
set noshowmode
set ruler
set number
set cursorline
set splitbelow
set splitright

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

" other settings
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

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" Toggle cursorline when entering/exiting insert mode
"autocmd InsertEnter,InsertLeave * set cul!
autocmd BufRead,BufNewFile * setlocal formatoptions-=ro
autocmd BufWrite * :RemoveTrailingSpaces
" =======================================

 "custom syntax settings
 "syntax bolding
hi Question cterm=bold
hi WarningMsg cterm=bold
hi Statement cterm=bold
hi PreProc cterm=bold
hi Type cterm=bold
hi Conditional cterm=bold
hi Keyword cterm=bold
hi Exception cterm=bold
hi PreCondit cterm=bold
hi StorageClass cterm=bold
hi Structure cterm=bold
hi Typedef cterm=bold
hi cssClassName cterm=bold
hi jsFunction cterm=bold
hi Function cterm=bold
hi Repeat cterm=bold
hi jsReturn cterm=bold

" Keymappings ================================
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

