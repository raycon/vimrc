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

nmap <silent> ,ev :e  $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

"-------------------------------------------------------------------------------
" Vundle Settings
"-------------------------------------------------------------------------------

" Do not use https request to download bundles
let $GIT_SSL_NO_VERIFY = 'true'

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The bundles you install will be listed here

" Color scheme
Plugin 'blerins/flattown'
" File explorer
Plugin 'The-NERD-tree'
" Beautiful status line
Plugin 'bling/vim-airline'
" Source navigation
Plugin 'EasyMotion'
" Bufkil
" Unload/delete/wipe a buffer, keep its window(s), display last accessed buffer(s)  
Plugin 'bufkill.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"-------------------------------------------------------------------------------
" VimOutliner
"-------------------------------------------------------------------------------

" Installation on Windows
" 1. Download VimOutliner 0.4.0
"    http://www.vim.org/scripts/script.php?script_id=3515
" 2. Extract files to '$HOME/vimfiles'
" 3. Edit 

"-------------------------------------------------------------------------------
" Bundle settings
"-------------------------------------------------------------------------------

" Color 
color flattown

" Airline
let g:airline_powerline_fonts = 1

" Airline - tabline
let g:airline#extensions#tabline#enabled = 1

" EasyMotion
let g:EasyMotion_leader_key = ';' 

" NERDTree
let NERDTreeChDirMode       = 2         " CWD is changed whenever the tree root is changed
let NERDTreeShowBookmarks   = 1         " Always show bookmarks
let NERDTreeWinPos          = "right"   " Position to right
nnoremap    <C-e>   :NERDTree .<CR> 

" NERDTree - ENTER
autocmd VimEnter * NERDTree $HOME       " auto open 
autocmd VimEnter * wincmd p             " move the cursor into the main window

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
    "set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10:cANSI
    set guifont=Consolas:h10:cANSI
    set guifontwide=NanumGothicCoding:h10:cDEFAULT
endif

" Get rid of | character in split bar
set fillchars+=vert:\  

" Automatically change the current directory
set autochdir

" Omni completion
" http://vim.wikia.com/wiki/Omni_completion
set omnifunc=syntaxcomplete#Complete

" Initial window size
" NERD 30 + Buffer 120 = 150
set lines=100 columns=150

" Change keyboard layout to english in normal mode
set noimdisable

"-------------------------------------------------------------------------------
" Key mapping
"-------------------------------------------------------------------------------

let mapleader = ","

" j and k move around wrapped line
nmap j gj
nmap k gk

" Window navigation
nmap <C-j> <c-w>j 
nmap <C-k> <c-w>k
nmap <C-l> <c-w>l
nmap <C-h> <c-w>h

" Buffer navigation
nmap <C-n> :bn<CR>
nmap <C-p> :bp<CR>

" Buffers
nmap <Leader>bd :bd<CR>

" resize current window by +/- 5 
nmap <D-left>   :vertical resize -5<CR>
nmap <D-down>   :resize +5<CR>
nmap <D-up>     :resize -5<CR>
nmap <D-right>  :vertical resize +5<CR>

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

" Toggle search highlight
noremap <silent> <Leader>h :set hlsearch! hlsearch?<CR>

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

" Folding
nnoremap <Space> za

" Timestamp
nnoremap <Leader>t =strftime("%Y-%m-%d %H:%M:%S")<CR>
inoremap <Leader>t <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
