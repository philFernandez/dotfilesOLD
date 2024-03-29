"      ==================================================        "
"     |  '||'  '|' '||' '||    ||' '||''|.     ..|'''.|  |       "
"     |   '|.  .'   ||   |||  |||   ||   ||  .|'     '   |       "
"     |    ||  |    ||   |'|..'||   ||''|'   ||          |       "
"     |     |||     ||   | '|' ||   ||   |.  '|.      .  |       "
"     |      |     .||. .|. | .||. .||.  '|'  ''|....'   |       "
"      ==================================================        "
" Notes {{{1
" gO opens TOC in help pages

" Type Math and other Symbols
" :dig! (opens chart)
" <c-k> <char><char> (in insert mode, types the symbol)
" π is typed with <c-k> p*
" ≤ is <c-k> =<, ≠ is <c-k> !=, ≥ is <c-k> >=
" need to be first {{{1

set nocompatible
let mapleader=','
let maplocalleader='\'
syntax enable
filetype plugin indent on

" Vim Plug {{{1
call plug#begin(stdpath('data') . '/plugged')
Plug 'lifepillar/vim-mucomplete'
Plug 'neovim/nvim-lspconfig'
Plug 'fatih/vim-go'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'preservim/nerdtree'
Plug 'mattn/calendar-vim'
Plug 'vimwiki/vimwiki'
Plug 'scrooloose/nerdcommenter'
Plug 'chiel92/vim-autoformat'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/vim-gitbranch'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-repeat'
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-gitgutter'
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
Plug 'honza/vim-snippets'
Plug 'chrisbra/csv.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'mattn/emmet-vim', { 'for': [ 'html', 'javascript', 'htmldjango' ] }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': 'javascript' }
call plug#end()

" LUA Things (that I don't understand shit about) {{{1

lua << EOF
-- require'lspconfig'.jedi_language_server.setup{}

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
--local servers = { 'jedi_language_server' }
local servers = { 'pylsp', 'sumneko_lua' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = vim.fn.stdpath('cache')..'/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}


EOF


" UI Settings {{{1
set background=dark
set showtabline=2
set noshowmode
set number
set ruler
set ttimeoutlen=0
set splitright
set laststatus=2
" Get rid of delay when entering normal mode
set timeoutlen=1000
set splitbelow
"---------------------
set cursorline
"autocmd InsertEnter * set nocursorline
"autocmd InsertLeave * set cursorline

" fix broken cursor line for neovim only ----------------
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

let g:fzf_preview_window = 'right:50%'

" Other VIM {{{1
set mouse=a
set lazyredraw
set backspace=indent,eol,start
set confirm
set hidden
set history=1000
set noswapfile
set autowrite
set updatetime=100
set wildmenu
set tags=./.git/tags;
set tags+=./tags;
set display=lastline
set showcmd
let g:tex_flavor = "latex"
let g:tex_no_error=1

if !isdirectory("/Users/philthy/.local/share/nvim/.vim-undo-dir")
  call mkdir("/Users/philthy/.local/share/nvim/.vim-undo-dir", "", 0700)
endif

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
" let g:formatdef_black = '~/.pyenv/shims/black'
let g:formatters_python = ['yapf']


au BufWrite *.tex,*.py :Autoformat
au BufWrite * :RemoveTrailingSpaces

" No automatic comments on next line
autocmd FileType * setlocal formatoptions-=ro
" Indent Settings {{{1
set autoindent
set expandtab " use spaces instead of tabs
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4
" Various Plugin Settings {{{1
let g:user_emmet_leader_key='<C-W>'
let g:tagbar_vertical = 30
" NERDTree/Commenter {{{1
let g:NERDAltDelims_c = 1
let g:NERDTreeQuitOnOpen = 1

" Search {{{1
set hlsearch
set ignorecase
set smartcase
set incsearch
" Text Render (wrap) {{{1
set encoding=utf-8
set linebreak " dont wrap in middle of word
"set nowrap
set wrapscan " continue search on next line

" Fold {{{1
"    Vim folding commands
"---------------------------------
"zf#j creates a fold from the cursor down # lines.
"zf/ string creates a fold from the cursor to string .
"zj moves the cursor to the next fold.
"zk moves the cursor to the previous fold.
"za toggle a fold at the cursor.
"zo opens a fold at the cursor.
"zO opens all folds at the cursor.
"zc closes a fold under cursor.
"zm increases the foldlevel by one.
"zM closes all open folds.  (fold all)
"zr decreases the foldlevel by one.
"zR decreases the foldlevel to zero -- (un-fold all)
"zd deletes the fold at the cursor.
"zE deletes all folds.
"[z move to start of open fold.
"]z move to end of open fold.
"---------------------------------
set foldmethod=indent
"set foldnestmax=1
set foldlevel=99
" uncomment to disable fold on file open
set nofoldenable
" vim-easy-align {{{1
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
vmap <Enter> <Plug>(EasyAlign)
" }}}
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
      \ 'right': [['modified']]
      \ }

let g:lightline.active = {
      \ 'left': [ [ 'mode', 'paste', 'spell' ],
      \           [ 'gitbranch', 'readonly', 'hunksummary' ] ],
      \ 'right': [['lineinfo', 'percent'], ['fileformat', 'fileencoding', 'filetype']]
      \ }

let g:lightline.separator = {
      \ 'left' : '',
      \ 'right': ''
      \ }

let g:lightline.subseparator = {
      \ 'left': '',
      \ 'right': ''
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
"let g:UltiSnipsSnippetsDir="~/.vim/ultisnips"
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
      \ '~/.zsh/aliases.zsh']
let g:startify_fortune_use_unicode = 1
" When adding/removing files from session
" automatically make saved session reflect
" changes
let g:startify_session_persistence = 1

"let g:startify_custom_header =
      "\ startify#pad(split(system('figlet -cf epic', 'neo-vim'), '\n'))

let g:startify_custom_header =
      "\ startify#pad(split(system('cowsay -f head-in', 'he uses vscode'), '\n'))
      \ startify#pad(split(system('cat ~/Documents/ren_and_stimpy.txt'), '\n'))

" Python Highlight {{{1
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0
let g:python_highlight_indent_errors = 0

" AutoPairs {{{1
if exists("AutoPairs")
  let g:AutoPairsMapCR = 0
  imap <expr><CR> "\<CR>\<Plug>AutoPairsReturn"
endif
let g:AutoPairsShortcutToggle = '<F10>'

" Easy Clip {{{1
let g:EasyClipAutoFormat = 1
let g:EasyClipUseSubstituteDefaults = 1
" Vimwiki {{{1
let g:vimwiki_list = [ {'path': '~/Notes/vimwiki',
                      \ 'name': 'Wiki',
                      \ 'auto_tags': 1,
                      \ 'index': 'index',
                      \ 'template_path': '~/Notes/.vimwiki_html_template',
                      \ 'path_html': '~/Notes/vimwiki_html'},
                      \
                      \ {'path': '~/Notes/Fall2020',
                      \  'name': 'Wiki2',
                      \  'auto_tags': 1,
                      \  'index': 'Fall2020',
                      \  'template_path': '~/Notes/.vimwiki_html_template',
                      \  'path_html': '~/Notes/Fall2020_html'},
                      \
                      \ {'path': '~/Notes/Work',
                      \  'name': 'WorkWiki',
                      \  'auto_tags': 1,
                      \  'index': 'WorkWikiIndex',
                      \  'template_path': '~/Notes/.vimwiki_html_template',
                      \  'path_html': '~/Notes/Work_html'}]

" Dont highjack all markdown files
let g:vimwiki_global_ext = 0
" Conceal fences around fenced code
let g:vimwiki_conceal_pre = 1
" Checklist highlighting
let g:vimwiki_hl_cb_checked = 1
" Better checklists symbols
let g:vimwiki_listsyms = ' ○◐●✓'
" Change TOC header
let g:vimwiki_toc_header = 'TOC'

" Prevent vimwiki from highjacking tab key
let g:vimwiki_key_mappings =
\ {
\   'table_mappings': 0
\ }


" -------------------------------------------
" This macro and command are for vimwiki TOC
" Macro makes a presentable link name, removing visible '#'

" For the macro run ':to,fromnorm! @g'
let @g = 'Iwwwvt]yf]i|p'

" command gets rid of uneeded TOC entries resulting
command! -range=% FixTOC :<line1>,<line2>g/\w\W\s=\|\w\s=/d
" -------------------------------------------

"let g:vimwiki_conceallevel=3

" Try this if highlighting messes up
"au BufEnter *.wiki :syntax sync fromstart
" CSV Files {{{1
let g:csv_delim='|'
"let g:csv_nomap_J = 1
"let g:csv_nomap_K = 1
let g:no_csv_maps = 1
" Completion  {{{1
set completeopt+=menuone
set completeopt+=noselect
set completeopt-=preview
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " Add only if Vim beeps during completion
let g:mucomplete#enable_auto_at_startup = 1
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Vim-Go {{{1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

" Keymaps {{{1
nnoremap <leader>r :Rg<CR>

map <silent><c-t> :TagbarOpenAutoClose<CR>
nnoremap <silent><leader>f :NERDTreeToggle<CR>
let NERDTreeMapMenu = '<A-m>'

" Show hightlight group of token under cursor
map <F10> :echo synIDattr(synID(line("."),col("."),1),"name")<CR>

" Delete contents of line w/o removing the line itself
nnoremap dl I<Esc>d$

" Turn off number inc/dec
"map <C-A> <Nop>
"map <C-X> <Nop>
"=======================

" pane navigation (A is for option key on mac)
"nnoremap <A-j> <c-w>j
"nnoremap <A-k> <c-w>k
"nnoremap <A-h> <c-w>h
"nnoremap <A-l> <c-w>l

" scroll each visible line of wrapped line
" (use g0 and g$ to move to begin and end of visible lines)
nnoremap <A-j> gj
nnoremap <A-k> gk

tnoremap <A-n> <c-\><c-n>

"copy into sys clipboard
vnoremap <silent> CP "+y
"paste from sys clipboard
nnoremap <silent> CV "+p
" copy line into sys clipboard
map <silent> CL I<Esc>v$h"+y

"Disable keybindings so that we can use <leader>ca for Calendar
map <plug>DisableNERDCommenterAltDelims <plug>NERDCommenterAltDelims
map <plug>DisableCalendarH <plug>CalendarH
map <plug>DisableCalendarV <plug>CalendarV
nnoremap <silent> <leader>ca :CalendarH<cr>
nnoremap gm m
nnoremap <silent> <c-s> :Startify<CR>
nnoremap <silent> <leader>cd :cd %:p:h<cr>
nnoremap <silent> <leader>n :set number!<cr>
nnoremap <silent> <leader>s :set spell!<cr>
nnoremap sa ggVG
nnoremap <F13> ggVGd
nnoremap <silent> bn :bnext<cr>
nnoremap <silent> bp :bNext<cr>
nnoremap <silent> bc :bdelete!<cr>
nnoremap <silent> <leader><space> :nohl<cr>
nnoremap J }
nnoremap K {
map Q :q<cr>
nnoremap <silent> CC :clo<cr>
nnoremap <space> A
nnoremap <silent> <leader>m :pclose<cr>
nnoremap <c-p> :Files<cr>

" resize splits
nnoremap <silent> <F5> :resize +2<cr>
nnoremap <silent> <F6> :resize -2<cr>
nnoremap <silent> <F7> :vertical resize +2<cr>
nnoremap <silent> <F8> :vertical resize -2<cr>
" How to open buffers
" ctrl-v = vertical split
" ctrl-x = split
" ctrl-t = tab
nnoremap <silent> <leader>l :Buf<CR>
nnoremap <silent> <leader>k :Win<CR>
nnoremap <silent> <leader>t :Tags<CR>
" Macros {{{1
" Switch out grading rubric for new one
"let @a = 'ggjVGkkkkkkkkd^Msay<80>kbkp'
" Commands {{{1
" vimwiki section has a command and a macro defined there
command! Zrecompile :!zrecompile
command! Cpdir silent! :!cpdir
command! KillBuffs silent! execute "%bd|e#|bd#"
command! Finder silent! :!finder
" modeline{{{1
" vim:foldenable foldmethod=marker foldcolumn=1 foldlevel=0
