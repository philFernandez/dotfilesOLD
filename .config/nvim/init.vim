"================================================================"
"        '||'  '|' '||' '||    ||' '||''|.     ..|'''.|          "
"         '|.  .'   ||   |||  |||   ||   ||  .|'     '           "
"          ||  |    ||   |'|..'||   ||''|'   ||                  "
"           |||     ||   | '|' ||   ||   |.  '|.      .          "
"            |     .||. .|. | .||. .||.  '|'  ''|....'           "
"================================================================"
" Notes {{{1
" gO opens TOC in help pages

" Type Math and other Symbols
" :digs! (opens chart)
" <c-k> <char><char> (in insert mode, types the symbol)
" π is typed with <c-k> p*
" ≤ is <c-k> =<, ≠ is <c-k> !=, ≥ is <c-k> >=
" need to be first {{{1
let mapleader=','
let maplocalleader='\'

" Vim Plug {{{1
call plug#begin(stdpath('data') . '/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'mattn/calendar-vim'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'scrooloose/nerdcommenter'
Plug 'chiel92/vim-autoformat'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/vim-gitbranch'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-repeat'
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-gitgutter'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug '/usr/local/opt/fzf/'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-syntax-extra', { 'for': [ 'cpp', 'c', 'vimwiki' ] }
Plug 'tpope/vim-surround'
Plug 'vim-python/python-syntax', { 'for': [ 'python', 'vimwiki' ]}
Plug 'rafi/awesome-vim-colorschemes'
Plug 'majutsushi/tagbar'
Plug 'junegunn/vim-easy-align'
Plug 'Clavelito/indent-awk.vim'
Plug 'svermeulen/vim-easyclip'
Plug 'ryanoasis/vim-devicons'
Plug 'cespare/vim-toml'
Plug 'SirVer/ultisnips'
Plug 'vim-scripts/applescript.vim'
Plug 'lilyball/vim-swift'
Plug 'chrisbra/csv.vim'
"Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
Plug 'mengelbrecht/lightline-bufferline'
Plug 'mattn/emmet-vim', { 'for': [ 'html', 'javascript', 'htmldjango' ] }
"Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
call plug#end()
set nocompatible
syntax enable
filetype plugin indent on

" UI Settings {{{1
" fix issues with lagging when matching parenthisis/brackets
"let g:matchparen_insert_timeout = 2
"let g:matchparen_timeout = 2
"-------------------------------------
set showtabline=2
set background=dark
set laststatus=2
set noshowmode
set ruler
set number
set splitbelow
set splitright
" Get rid of delay when entering normal mode
set timeoutlen=1000
set ttimeoutlen=0
"---------------------
"set cursorline
"autocmd InsertEnter * set nocursorline
"autocmd InsertLeave * set cursorline

" fix broken cursor line --------------------------------
function! s:CustomizeColors()
  if has('guirunning') || has('termguicolors')
    let cursorline_gui=''
    let cursorline_cterm='ctermfg=white'
  else
    let cursorline_gui='guifg=white'
    let cursorline_cterm=''
  endif
  exec 'hi CursorLine ' . cursorline_gui . ' ' . cursorline_cterm
endfunction

augroup OnColorScheme
  autocmd!
  autocmd ColorScheme,BufEnter,BufWinEnter * call s:CustomizeColors()
augroup END
" -------------------------------------------------------
augroup TermThings
  " Events Available: TermOpen, TermEnter, TermLeave, TermClose
  autocmd!
  autocmd TermOpen * setlocal nonumber
  "autocmd TermOpen,TermEnter * setlocal notermguicolors
  "autocmd TermClose,TermLeave * setlocal termguicolors
augroup END

" Other VIM {{{1
set mouse=a
set lazyredraw
"set autoread
set backspace=indent,eol,start
set confirm
set hidden
set history=1000
set noswapfile
set autowrite
set updatetime=100
"set scrolloff=3
set wildmenu
set tags=./.git/tags;
set tags+=./tags;
"set path+=/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/include
"set path+=/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/Kernel.framework/Versions/A/Headers
set display=lastline
set showcmd
"set ttyfast
"set report=0
"set synmaxcol=200
let g:tex_flavor = "latex"
let g:tex_no_error=1

if !isdirectory("/Users/philthy/.local/share/nvim/.vim-undo-dir")
  call mkdir("/Users/philthy/.local/share/nvim/.vim-undo-dir", "", 0700)
endif

"set undodir=/tmp/.vim-undo-dir
set undodir=/Users/philthy/.local/share/nvim/.vim-undo-dir
set undofile

" keep window position static when switching between buffers
au BufLeave * let b:winview = winsaveview()
au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
" --------------------------------------------------------------------------

" Autoformat {{{1
if !exists('g:formatdef_latexindent')
  let g:formatdef_latexindent = '"latexindent.pl - 2>/dev/null"'
endif
let g:formatters_tex = ['latexindent']

au BufWrite *.tex :Autoformat
au BufWrite * :RemoveTrailingSpaces

" No automatic comments on next line
autocmd FileType * setlocal formatoptions-=ro
" Indent Settings {{{1
set autoindent
set expandtab " use spaces instead of tabs
set shiftround
set shiftwidth=2
set smarttab
set tabstop=2
" Various Plugin Settings {{{1
let g:user_emmet_leader_key='<C-W>'
let g:tagbar_vertical = 30
" NERDTree/Commenter {{{1
"let g:NERDTreeQuitOnOpen = 1
let g:NERDAltDelims_c = 1

" Search {{{1
set hlsearch
set ignorecase
set noincsearch
set smartcase
set incsearch
" Text Render (wrap) {{{1
set encoding=utf-8
set linebreak " dont wrap in middle of word
set nowrap
set wrapscan " continue search on next line

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
"set foldnestmax=1
set foldlevel=0
" uncomment to disable fold on file open
set nofoldenable
" vim-easy-align {{{1
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }}}
" highlightedyank {{{1
let g:highlightedyank_highlight_duration = 2500
" Lightline {{{1

let g:lightline = {}

let g:lightline.colorscheme = 'wombat'

let g:lightline.component_function = {
      \ 'gitbranch'  : 'gitbranch#name',
      \ 'cocstatus'  : 'coc#status',
      \ 'hunksummary': 'hunkstatus#gitgutter'
      \ }

let g:lightline.component_expand = {
      \ 'buffers': 'lightline#bufferline#buffers',
      \ }

let g:lightline.component_type = {
      \ 'buffers' : 'tabsel',
      \ }

let g:lightline.tabline = {
      \ 'left' : [['buffers']],
      \ 'right': [['modified'], ['cocstatus']]
      \ }

let g:lightline.active = {
      \ 'left': [ [ 'mode', 'paste', 'spell' ],
      \           [ 'gitbranch', 'readonly', 'hunksummary' ] ],
      \ 'right': [['lineinfo'], ['fileformat', 'fileencoding', 'filetype']]
      \ }

let g:lightline.separator = {
      \ 'left' : '',
      \ 'right': ''
      \ }

let g:lightline.subseparator = {
      \ 'left': '',
      \ 'right': ''
      \ }

" Top bar of lightline ---(separate plugin)-------
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#enable_devicons = '1'
let g:lightline#bufferline#unicode_symbols = '1'
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
let g:lightline#bufferline#show_number = '2'
let g:lightline#bufferline#number_map = {
      \ 0: '⁰', 1: '¹', 2: '²', 3: '³', 4: '⁴',
      \ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'}
" ------------------------------------------------


" Ultisnips {{{1
let g:UltiSnipsSnippetsDir="~/.vim/ultisnips"
let g:UltiSnipsSnippetDirectories=["ultisnips"]
let g:UltiSnipsExpandTrigger="<leader>n"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" Startify {{{1

" Show devicons
function! StartifyEntryFormat()
  return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

let g:startify_bookmarks = [
      \ '~/.config/nvim/init.vim',
      \ '~/.zsh/.zwc_dotfiles/.zshrc',
      \ '~/.zshenv',
      \ '~/.zsh/aliases.zsh',
      \ '~/Library/Preferences/org.dystroy.broot/conf.toml']
let g:startify_fortune_use_unicode = 1
" When adding/removing files from session
" automatically make saved session reflect
" changes
let g:startify_session_persistence = 1

let g:startify_custom_header =
      \ startify#pad(split(system('figlet -cf epic', 'neo-vim'), '\n'))

" Python Highlight {{{1
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0
let g:python_highlight_indent_errors = 0

" AutoPairs {{{1
if exists("AutoPairs")
  let g:AutoPairsMapCR = 0
  imap <expr><CR> "\<CR>\<Plug>AutoPairsReturn"
  let g:AutoPairsShortcutToggle = '<F10>'
endif

" Easy Clip {{{1
let g:EasyClipAutoFormat = 1
let g:EasyClipUseSubstituteDefaults = 1
" Vimwiki & Vinotes {{{1
let g:notes_directories = ['~/Notes/viNotes']
let g:vimwiki_list = [{'path': '~/Notes/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md',
                      \ 'auto_tags' : 1, 'auto_diary_index': 1},
                      \
                      \{'path': '~/Notes/vimwiki2',
                      \ 'name': 'Wiki2',
                      \ 'auto_tags': 1,
                      \ 'index': 'index2',
                      \ 'template_path': '~/Notes/.vimwiki_html_template',
                      \ 'path_html': '~/Notes/vimwiki2_html'},
                      \
                      \ {'path': '~/Documents/vimwiki3',
                      \  'name': 'Cool Wiki',
                      \  'auto_tags': 1,
                      \  'index': 'CoolPage',
                      \  'template_path': '~/Documents/vimwiki3/templates',
                      \  'path_html': '~/Documents/vimwiki3/html'}]

" Dont highjack all markdown files
let g:vimwiki_global_ext = 0
" Dont highjack tab key
let g:vimwiki_table_mappings = 0
" Conceal fences around fenced code
let g:vimwiki_conceal_pre = 1
" Checklist highlighting
let g:vimwiki_hl_cb_checked = 1
" Better checklists symbols
let g:vimwiki_listsyms = ' ○◐●✓'


"let g:vimwiki_conceallevel=3

" Try this if highlighting messes up
"au BufEnter *.wiki :syntax sync fromstart
" CSV Files {{{1
let g:csv_delim='|'
" Completion {{{1
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
autocmd FileType json syntax match Comment +\/\/.\+$+
" Keymaps {{{1

map <silent><c-t> :TagbarOpenAutoClose<CR>
nnoremap <silent><leader>f :NERDTreeToggle<CR>
nnoremap <silent><esc> :NERDTreeClose<CR>

" Show hightlight group of token under cursor
map <F10> :echo synIDattr(synID(line("."),col("."),1),"name")<CR>

" Delete contents of line w/o removing the line itself
nnoremap dl I<Esc>d$

" Turn off number inc/dec
"map <C-A> <Nop>
"map <C-X> <Nop>
"=======================

" pane navigation
nnoremap <A-j> <c-w>j
nnoremap <A-k> <c-w>k
nnoremap <A-h> <c-w>h
nnoremap <A-l> <c-w>l

tnoremap <A-n> <c-\><c-n>
"tnoremap <c-k> <c-\><c-n><c-w>k

"copy into sys clipboard
vnoremap <silent> cp "+y
"past from sys clipboard
nnoremap <silent> cv "+p
"Disable keybindings so that we can use <leader>ca for Calendar
map <plug>DisableNERDCommenterAltDelims <plug>NERDCommenterAltDelims
map <plug>DisableCalendarH <plug>CalendarH
map <plug>DisableCalendarV <plug>CalendarV
nnoremap <silent> <leader>ca :CalendarH<cr>
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

command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" How to open buffers
" ctrl-v = vertical split
" ctrl-x = split
" ctrl-t = tab
nnoremap <silent> <leader>l :Buf<CR>
nnoremap <silent> <leader>k :Win<CR>
nnoremap <silent> <leader>t :Tags<CR>

"map <c-b> :w<CR>:!rsync -avr --exclude '.git' ~/Spring_2020/CSC135/Homework/PL_1/html/ fernandp@titan.ecs.csus.edu:/gaia/class/student/fernandp/html/<CR>
"map <c-b> :w<CR>:!rsync -avr --exclude '.git' ~/Spring_2020/CSC159/Homework/Phase1/p-code2/ user@192.168.0.65:/home/user/CSC159/TEST<CR>
"map <c-b> :w<CR>:!rsync -avr --exclude '.git' --exclude '.idea' --exclude '.vim' ~/Spring_2020/CSC159/Homework/Phase2/CSC159_Phase1/ user@192.168.0.65:/home/user/CSC159/Phase2<CR>

" commands {{{1
command! Zrecompile :!zrecompile
command! Cpdir silent! :!cpdir
command! KillBuffs silent! execute "%bd|e#|bd#"
" modeline{{{1
" vim:foldenable foldmethod=marker foldcolumn=1
