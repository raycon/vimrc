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
" Vundle - START
"-------------------------------------------------------------------------------

" Do not use https request to download bundles
let $GIT_SSL_NO_VERIFY = 'true'

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"-------------------------------------------------------------------------------
" ESSENTIAL
"-------------------------------------------------------------------------------

Plugin 'blerins/flattown'       " Color scheme
Plugin 'The-NERD-tree'          " File explorer
Plugin 'bling/vim-airline'      " Beautiful status line
Plugin 'EasyMotion'             " Source navigation
Plugin 'delimitMate.vim'        " Auto-completion for quotes, parens, brackets.
Plugin 'bufkill.vim'            " Buffer management
Plugin 'tComment'               " Toggle comments
Plugin 'Yggdroot/indentLine'    " Indent guide line

"-------------------------------------------------------------------------------
" SANDBOX
"-------------------------------------------------------------------------------

" Markdown support
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" HTML
Plugin 'surround.vim'
Plugin 'othree/html5.vim'
Plugin 'skammer/vim-css-color' 
Plugin 'matchit.zip'

" AutoComplete
Plugin 'AutoComplPop'

" File buffer explorer
Plugin 'ctrlp.vim'

" Highlights problems with syntax
" Plugin 'Syntastic'

"-------------------------------------------------------------------------------
" Vundle - END
"-------------------------------------------------------------------------------

call vundle#end()            " required
filetype plugin indent on    " required

"-------------------------------------------------------------------------------
" Plugin Settings
"-------------------------------------------------------------------------------

" Color 
" Modify flattown.vim > hi Title guifg=#ffd75f
colorscheme flattown

" Airline
let g:airline_powerline_fonts = 1

" Airline - tabline
let g:airline#extensions#tabline#enabled = 1

" EasyMotion
let g:EasyMotion_leader_key = ';' 
nmap w ;w
nmap b ;b
nmap B ;B

" NERDTree
let NERDTreeChDirMode       = 2         " CWD is changed whenever the tree root is changed
let NERDTreeShowBookmarks   = 1         " Always show bookmarks
let NERDTreeWinPos          = "right"   " Position to right
nnoremap    <C-e>   :NERDTreeToggle<CR> 

" NERDTree - ENTER
autocmd VimEnter * NERDTree ~/Notes     " auto open 
autocmd VimEnter * wincmd p             " move the cursor into the main window

" tComment
map <leader>c <c-_><c-_>

"-------------------------------------------------------------------------------
" Tabularize for markdown table align
" https://gist.github.com/tpope/287147
"-------------------------------------------------------------------------------
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction

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
if has("mac")
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
elseif has("win32")
    source $VIMRUNTIME/mswin.vim
    set guifont=Consolas:h10:cANSI
    set guifontwide=NanumGothicCoding:h10cDEFAULT
    " NERD 30 + Buffer 120 = 150
    set lines=50 columns=150
endif

" Get rid of | character in split bar
set fillchars+=vert:\  

" Automatically change the current directory
" set autochdir

" Omni completion
" http://vim.wikia.com/wiki/Omni_completion
set omnifunc=syntaxcomplete#Complete

" Change keyboard layout to english in normal mode
set noimdisable
set iminsert=1
set imsearch=-1

"-------------------------------------------------------------------------------
" Key Mapping
"-------------------------------------------------------------------------------

let mapleader = ","

" j and k move around wrapped line
map j gj
map k gk

" Buffer navigation
nnoremap <C-n> :bn<CR>
" nnoremap <C-p> :bp<CR>

" Buffers
nmap <Leader>d :bd<CR>

" Windows navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z==
nmap <M-k> mz:m-2<cr>`z==
imap <M-j> <Esc>:m+<CR>==gi
imap <M-k> <Esc>:m-2<CR>==gi
vmap <M-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z
nmap <D-j> mz:m+<cr>`z==
nmap <D-k> mz:m-2<cr>`z==
imap <D-j> <Esc>:m+<CR>==gi
imap <D-k> <Esc>:m-2<CR>==gi
vmap <D-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
vmap <D-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z

" Toggle search highlight
noremap <silent> <Leader>h :set hlsearch! hlsearch?<CR>

" Toggle wrap mode
nmap <Leader>w :setlocal wrap!<CR>:setlocal wrap?<CR>

" Toggle number
nmap <Leader>n :setlocal number!<CR>

" Auto complete
inoremap <C-Space> <C-x><C-o>

" Auto complete - Tags
inoremap <lt>/ </<C-X><C-O>

" Folding
nnoremap <Space> za

" Indent
nnoremap <c-i> mqHmwgg=G`wzt`q

" Yank all
nmap ya :%y+<CR>

" Search the current file for what's currently in the search register
nmap <silent> <Leader>gs :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>
" Search the current file for the word under the cursor
nmap <silent> <Leader>gw :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:nohls<CR>
" Search the current file for the WORD under the cursor
nmap <silent> <Leader>gW :vimgrep /<C-r><C-a>/ %<CR>:ccl<CR>:fcwin<CR><C-W>J:nohls<CR>

" Search the word and list result to Quickfix window.
function! GrepQuickfix()
    call inputsave()
    let replacement = input('Search: ')
    call inputrestore()
    if !empty(replacement)
        execute ':vimgrep /'.replacement.'/ '.bufname("%")
        ccl
        cwin
        execute "normal \<c-w>J"
        nohls
    endif
endfunction
nmap <silent> <Leader>f :call GrepQuickFix()<CR>
