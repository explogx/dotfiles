scriptencoding utf-8
set encoding=utf-8
setglobal fileencoding=utf-8

" Drawing box vertical bar
if exists("&fillchars")
  set fillchars=vert:\\u2502
endif

" Uncomment the following to enable syntax highlighting by default
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Trim unwanted trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype
filetype plugin indent on

set laststatus=2                " Enable status line
set noshowmode                  " Do not show mode in status line
set number                      " Show line numbers
set relativenumber              " Show relative line numbers
set ruler                       " Show ruler
set showcmd                     " Show command in status line
set noswapfile                  " Disable the swapfile
set showmatch                   " Show matching brackets
set ignorecase                  " Do case insensitive matching
set smartcase                   " Do smart case matching
set autoindent                  " Do automatic indenting
set smartindent                 " Do smart indenting
set hlsearch                    " Highlight search matches
set incsearch                   " Incremental search
set hidden                      " Hide buffers when they are abandoned
set tabstop=2                   " Number of columns a tab character has
set shiftwidth=2                " Number of columns a new level of indentation has
set expandtab                   " Expand tabs into spaces
set smarttab                    " Smart tab insertion on new lines
set backspace=indent,eol,start  " Make backspace behaves as in most other programs
set timeoutlen=200              " Short timeout for commands

" Map CTRL-N to `:let @/ = ""`
nnoremap <silent><C-N> :let @/ = ""<CR>

" Remap j and k to their gj and gk counterparts and vice-versa
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Disable arrows keys and backspace except in Insert mode
nnoremap <Left> <Nop>
nnoremap <Down> <Nop>
nnoremap <Up> <Nop>
nnoremap <Right> <Nop>
nnoremap <BS> <Nop>

vnoremap <Left> <Nop>
vnoremap <Down> <Nop>
vnoremap <Up> <Nop>
vnoremap <Right> <Nop>
vnoremap <BS> <Nop>

" Use tab indentation for Makefile
autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab

" Set formatter for various filetypes
autocmd FileType markdown set equalprg=prettier\ --parser\ markdown
autocmd FileType python set equalprg=black\ --quiet\ -

" Enable markdown folding
let g:markdown_folding = 1

" Autoclosing
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {;<CR> {<CR>};<Esc>O

" Use terminal bg with papercolor
let g:PaperColor_Theme_Options = {
      \ 'theme': {
      \   'default': {
      \     'transparent_background': 1
      \   }
      \ }
      \ }

" Enable papercolor theme
colorscheme papercolor

" For vim-lightline
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'enable': {
      \   'statusline': 1,
      \   'tabline': 1,
      \ },
      \ 'subseparator': {
      \   'left':  '\uFF5C',
      \   'right': '\uFF5C'
      \ },
      \ 'active': {
      \   'left': [
      \     ['mode', 'paste'],
      \     ['gitbranch', 'readonly', 'filename', 'modified']
      \   ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ }
      \ }

" For vim-syntastic
if exists("&statusline")
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
endif

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

if exists("&completeopt")
  set completeopt-=preview
endif

autocmd CursorMovedI * if pumvisible() == 0 | pclose | endif
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif

let g:syntastic_terraform_tffilter_plan = 1
let g:terraform_completion_keys = 1
let g:terraform_registry_module_completion = 0

" For vim-gitgutter
highlight SignColumn guibg=NONE ctermbg=NONE

" Fold unmatched portions of text
cnoreabbrev <silent>foldsearch setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0<CR>
