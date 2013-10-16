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
" Add lines to indent-block
Bundle 'Yggdroot/indentLine'
Bundle 'terryma/vim-smooth-scroll'

" ------  SCRIPTS UNDER TEST
" Bundle 'bling/vim-bufferline'
" let g:bufferline_show_bufnr = 0
" Bundle 'vimwiki/vimwiki'

filetype plugin indent on   " required!

"-------------------------------------------------------------------------------
" Bundle settings
"-------------------------------------------------------------------------------

" Molokai 
colorscheme molokai

" Airline
let g:airline_powerline_fonts = 1

" Airline - tabline
let g:airline#extensions#tabline#enabled = 1
nnoremap    <C-n>       :bn<CR>
nnoremap    <C-p>       :bp<CR>

" vim-css-color
let g:cssColorVimDoNotMessMyUpdatetime = 1

" EasyMotion
let g:EasyMotion_leader_key = ';' 

" NERDTree
let NERDTreeChDirMode = 2               " CWD is changed whenever the tree root is changed
autocmd     VimEnter *   NERDTree $HOME " auto open 
autocmd     VimEnter *   wincmd p       " move the cursor into the main window
nnoremap    <C-e>       :NERDTree .<CR> 

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>
"-------------------------------------------------------------------------------
" Global Settings
"-------------------------------------------------------------------------------

" Switch on syntax highlighting.
syntax on

" Use 4 spaces instead of tab
set tabstop=4       " Column counts for tab
set shiftwidth=4    " Column counts for <<, >>
set softtabstop=4   " Space count for tab key in INSERT mode
set smarttab        " When off, <Tab> will not inserts spaces according to 'shiftwidth' in front of a line
set expandtab       " Use spaces instead of tabs
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

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set noswapfile

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Encoding
set encoding=utf-8

" Set language
lang mes en_US

" GUI options
set guioptions-=m   " remove menu bar
set guioptions-=T   " remove toolbar
set guioptions-=r   " remove right-hand scroll bar
set guioptions-=L   " remove right-hand scroll bar

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

" Initial window size
" NERD 30 + Buffer 120 = 150
set lines=100 columns=150

"-------------------------------------------------------------------------------
" Key mapping
"-------------------------------------------------------------------------------

let mapleader = "\<space>"

" j and k move around wrapped line
nmap j gj
nmap k gk

" Window navigation
nnoremap <C-j> <c-w>j 
nnoremap <C-k> <c-w>k
nnoremap <C-l> <c-w>l
nnoremap <C-h> <c-w>h

" Toggle search highlight
noremap <silent> <Leader>h :set hlsearch! hlsearch?<CR>

" resize current window by +/- 5 
nnoremap <D-left> :vertical resize -5<CR>
nnoremap <D-down> :resize +5<CR>
nnoremap <D-up> :resize -5<CR>
nnoremap <D-right> :vertical resize +5<CR>

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z==
nmap <M-k> mz:m-2<cr>`z==
imap <D-j> <Esc>:m+<CR>==gi
imap <D-k> <Esc>:m-2<CR>==gi
vmap <M-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z

if has("mac") || has("macunix")
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    imap <D-j> <M-j>
    imap <D-h> <M-h>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
endif

" Toggle wrap mode
nmap <Leader>w :setlocal wrap!<CR>:setlocal wrap?<CR>

" Toggle number
nmap <Leader>n :setlocal number!<CR>

" Auto complete
inoremap <C-Space> <C-x><C-o>

" Search the current file for what's currently in the search register
nmap <silent> <Leader>gs :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>
" Search the current file for the word under the cursor
nmap <silent> <Leader>gw :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>
" Search the current file for the WORD under the cursor
nmap <silent> <Leader>gW :vimgrep /<C-r><C-a>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>
