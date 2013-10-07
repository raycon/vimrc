" vimrc by raegon@gmail.com
" Remap for easy edit 
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

"-----------------------------------------------------------------------------
" Vundle Settings
"-----------------------------------------------------------------------------
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Do not use https request to download bundles
let $GIT_SSL_NO_VERIFY = 'true'

" let Vundle manage Vundle required! 
Bundle 'gmarik/vundle'

" The bundles you install will be listed here
Bundle 'molokai'
Bundle 'The-NERD-tree'
Bundle 'bling/vim-airline'
Bundle 'skammer/vim-css-color'
Bundle 'groenewege/vim-less'
Bundle 'AutoComplPop'
Bundle 'ctrlp.vim'

filetype plugin indent on     " required!

"-----------------------------------------------------------------------------
" Bundle settings
"-----------------------------------------------------------------------------

" Molokai
colorscheme molokai

" Airline
let g:airline_powerline_fonts = 1
" let g:airline_theme='powerlineish'

" vim-css-color
let g:cssColorVimDoNotMessMyUpdatetime = 1

"-----------------------------------------------------------------------------
" Global Settings
"-----------------------------------------------------------------------------

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

" Encoding
set encoding=utf-8

" Change menu to English
lang mes en_US
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Font
if has("unix")
    set guifont=Monaco\ for\ Powerline:h13
elseif has("win32")
    source $VIMRUNTIME/mswin.vim
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10
    set guifontwide=NanumGothicCoding:h10:cDEFAULT
endif

" Get rid of | character in split bar
set fillchars+=vert:\  

" Show line numbers
" set number

" Omni completion
" http://vim.wikia.com/wiki/Omni_completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

"-----------------------------------------------------------------------------
" Key mapping
"-----------------------------------------------------------------------------

" j and k move around wrapped line
nmap j gj
nmap k gk

" turn off search highlight
nmap <silent> ,h :nohlsearch<cr>

" buffer navigation
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" resize current buffer by +/- 5 
nnoremap <D-left> :vertical resize -5<CR>
nnoremap <D-down> :resize +5<CR>
nnoremap <D-up> :resize -5<CR>
nnoremap <D-right> :vertical resize +5<CR>

" for moving lines like eclipse
" Windows
nnoremap <M-k> mz:m-2<cr>`z==
inoremap <M-j> <Esc>:m+<CR>==gi
inoremap <M-k> <Esc>:m-2<CR>==gi
vnoremap <M-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
nnoremap <M-j> mz:m+<CR>`z==
vnoremap <M-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z

" OSX
nnoremap <D-k> mz:m-2<cr>`z==
inoremap <D-j> <Esc>:m+<CR>==gi
inoremap <D-k> <Esc>:m-2<CR>==gi
vnoremap <D-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
nnoremap <D-j> mz:m+<CR>`z==
vnoremap <D-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z

" NERDTree
nmap <C-e> :NERDTreeToggle<CR>

" Toggle wrap mode
nmap \w :setlocal wrap!<CR>:setlocal wrap?<CR>

" Auto complete
" inoremap <C-Space> <C-x><C-o>
