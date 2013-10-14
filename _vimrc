"                                _                    
"                         __ __ (_)  _ __    _ _   __ 
"                         \ V / | | | '  \  | '_| / _|
"                          \_/  |_| |_|_|_| |_|   \__|
"
"                             by raegon@gmail.com
"
"-------------------------------------------------------------------------------
" Remap for easy edit 
"-------------------------------------------------------------------------------

nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

"-------------------------------------------------------------------------------
" Vundle Settings
"-------------------------------------------------------------------------------

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Do not use https request to download bundles
let $GIT_SSL_NO_VERIFY = 'true'

" let Vundle manage Vundle required! 
Bundle 'gmarik/vundle'

" The bundles you install will be listed here

" Color scheme
Bundle 'molokai'
" File explorer
Bundle 'The-NERD-tree'
" Beautiful status line
Bundle 'bling/vim-airline'
" Show the colors in css
Bundle 'ap/vim-css-color'
" Syntax highlighting for less file
Bundle 'groenewege/vim-less'
" Source navigation
Bundle 'EasyMotion'
" Buffer list in small buffer
Bundle 'fholgado/minibufexpl.vim'

filetype plugin indent on     " required!

"-------------------------------------------------------------------------------
" Bundle settings
"-------------------------------------------------------------------------------

" Molokai
colorscheme molokai

" Airline
let g:airline_powerline_fonts = 1

" vim-css-color
let g:cssColorVimDoNotMessMyUpdatetime = 1

" EasyMotion
let g:EasyMotion_leader_key = '<Leader>' 

" NERDTree
let NERDTreeChDirMode=2

"-------------------------------------------------------------------------------
" Global Settings
"-------------------------------------------------------------------------------

" Switch on syntax highlighting.
syntax on

" Use 4 spaces instead of tab
set tabstop=4       " Column counts for tab
set shiftwidth=4    " Column counts for <<, >>
set softtabstop=4   " Space count for tab key in INSERT mode
set expandtab       " Change tab to spaces
set autoindent      " Copy indent from current line when starting a new line

" Search
set wrapscan        " Search wrap lines
set incsearch       " Incrementally match the search
set ignorecase      " Search ignore case
set smartcase       " /foo matches FOO and fOo, but /FOO only matches the former
set hlsearch        " Enable search highlighting

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" tell VIM to always put a status line in, even if there is only one window
" (related with airline)
set laststatus=2

" Keep some stuff in the history
set history=100

" Any buffer can be hidden (keeping its changes) without write
set hidden

" Encoding
set encoding=utf-8

" Set language
lang mes en_US

" GUI options
set guioptions-=m   "remove menu bar
set guioptions-=T   "remove toolbar
" set guioptions-=r "remove right-hand scroll bar

" Font
if has("unix")
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h14
elseif has("win32")
    source $VIMRUNTIME/mswin.vim
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10
    set guifontwide=NanumGothicCoding:h10:cDEFAULT
endif

" Get rid of | character in split bar
set fillchars+=vert:\  

" Show line numbers
" set number

" Automatically change the current directory
set autochdir

" Omni completion
" http://vim.wikia.com/wiki/Omni_completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

"-------------------------------------------------------------------------------
" Key mapping
"-------------------------------------------------------------------------------

let mapleader = "\<space>"

" j and k move around wrapped line
nmap j gj
nmap k gk

" Toggle search highlight
noremap <silent> <Leader>h :set hlsearch! hlsearch?<CR>

" Window navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" Easier buffer switching
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>

" resize current window by +/- 5 
nnoremap <D-left> :vertical resize -5<CR>
nnoremap <D-down> :resize +5<CR>
nnoremap <D-up> :resize -5<CR>
nnoremap <D-right> :vertical resize +5<CR>

" for moving lines like eclipse
" Windows
nnoremap <M-j> mz:m+<CR>`z==
nnoremap <M-k> mz:m-2<cr>`z==
inoremap <M-j> <Esc>:m+<CR>==gi
inoremap <M-k> <Esc>:m-2<CR>==gi
vnoremap <M-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
vnoremap <M-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z

" OSX
nnoremap <D-j> mz:m+<CR>`z==
nnoremap <D-k> mz:m-2<cr>`z==
inoremap <D-j> <Esc>:m+<CR>==gi
inoremap <D-k> <Esc>:m-2<CR>==gi
vnoremap <D-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
vnoremap <D-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z

" NERDTree
nmap <C-e> :NERDTree .<CR>

" Toggle wrap mode
nmap \w :setlocal wrap!<CR>:setlocal wrap?<CR>

" Toggle number
nmap <leader>n :setlocal number!<CR>

" Auto complete
" inoremap <C-Space> <C-x><C-o>

" Search the current file for what's currently in the search register
nmap <silent> <leader>gs :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>
" Search the current file for the word under the cursor
nmap <silent> <leader>gw :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>
" Search the current file for the WORD under the cursor
nmap <silent> <leader>gW :vimgrep /<C-r><C-a>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>

"-------------------------------------------------------------------------------
" Personal usage
"-------------------------------------------------------------------------------

" Decrypt logs
map <F8> :! D:\tools\decrypt_vim.bat %:p<CR>:e <C-R>=expand("%:r")."_decrypted.log"<CR>
