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
nmap <silent> ,pl :PluginList<CR>
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

"-------------------------------------------------------------------------------
" VUNDLE
"-------------------------------------------------------------------------------

" Do not use https request to download bundles
let $GIT_SSL_NO_VERIFY = 'true'

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Essential --------------------------------------------------------------------

Plugin 'blerins/flattown'          " Color scheme
Plugin 'Yggdroot/indentLine'       " Indent guide line
Plugin 'luochen1990/rainbow'       " Colorize parentheses
Plugin 'scrooloose/nerdtree'       " File explorer
Plugin 'bling/vim-airline'         " Beautiful status line
Plugin 'easymotion/vim-easymotion' " Source navigation
Plugin 'Raimondi/delimitMate'      " Auto-completion for quotes, parens, brackets.
Plugin 'tomtom/tcomment_vim'       " Toggle comments
Plugin 'qpkorr/vim-bufkill'        " Close buffer without closing window

" Sandbox ----------------------------------------------------------------------

" Markdown support
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" HTML
Plugin 'tpope/vim-surround'
" Plugin 'othree/html5.vim'
Plugin 'ap/vim-css-color' 
Plugin 'vim-scripts/matchit.zip'

" JavaScript
Plugin 'jelera/vim-javascript-syntax'
" Plugin 'scrooloose/syntastic'      " Syntax checking
" Plugin 'marijnh/tern_for_vim'

" AutoComplete
Plugin 'vim-scripts/AutoComplPop'
Plugin 'ervandew/supertab'       " insert-mode completion with Tab.

" File buffer explorer
Plugin 'kien/ctrlp.vim'

" Scroll
Plugin 'terryma/vim-smooth-scroll'

" Toggle Quickfix and Location list
Plugin 'milkypostman/vim-togglelist'

" Preserve buffers
" Plugin 'xolox/vim-session'
" Plugin 'xolox/vim-misc'
" let g:session_directory = $HOME.'/.vimsession'

" Git
Plugin 'tpope/vim-fugitive'

" VUNDLE END -------------------------------------------------------------------

call vundle#end()
filetype plugin indent on

"-------------------------------------------------------------------------------
" GLOBAL SETTINGS
"-------------------------------------------------------------------------------

" Enable syntax highlighting
syntax on

" Set 7 line padding to cursor
set so=7

" Auto read when file is changed from outside
set autoread

" Highlight current line
set cursorline

" Space and Tab     " Use 4 spaces instead of tab
set tabstop=4       " Column counts for tab
set shiftwidth=4    " Column counts for <<, >>
set softtabstop=4   " Space count for tab key in INSERT mode
set smarttab        " When off, <Tab> will not inserts spaces in front of a line
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

" Get rid of | character in split bar
set fillchars+=vert:\  

" Omni completion
" http://vim.wikia.com/wiki/Omni_completion
set omnifunc=syntaxcomplete#Complete

" Change keyboard layout to english in normal mode
set noimdisable
set iminsert=1
set imsearch=-1

" Show line numbers
set number

" tmux Background Color Erase
set t_ut=    

"-------------------------------------------------------------------------------
" KEY MAPPING
"-------------------------------------------------------------------------------

let mapleader = ","

" j and k move around wrapped line
map j gj
map k gk

" Buffers
nmap <leader>d :BD<CR>
nmap <leader>c <c-w>c

" Files
nmap <leader>w :w!<CR>

" Replace word under the cursor
nnoremap <leader>r :%s/\<<C-r><C-w>\>//gcl<Left><Left><Left><Left>

" Buffer navigation
nnoremap <c-n> :bn<CR>
nnoremap <c-p> :bp<CR>

" Tab navigation
nnoremap t<insert>  :tabnew<CR>
nnoremap t<delete>  :tabclose<CR>
nnoremap tp         :tabprev<CR>
nnoremap tn         :tabnext<CR>
nnoremap te         :tabedit <c-r>=expand("%:p:h")<cr>/

" Windows navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Move a line of text using ALT+[hjkl] or Comamnd+[hjkl] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
nmap <M-h> <<
nmap <M-l> >>
vmap <M-h> <gv
vmap <M-l> >gv

if has("mac") || has("macunix")
    nmap <D-h> <M-h>
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    nmap <D-l> <M-l>
    vmap <D-h> <M-h>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
    vmap <D-l> <M-l>
endif

" Toggle search highlight
nmap <silent> <leader>h :set hlsearch! hlsearch?<CR>

" Toggle wrap mode
" nmap <leader> <leader>w :setlocal wrap!<CR>:setlocal wrap?<CR>

" Toggle number
nmap <silent> <leader>n :setlocal number!<CR>

" Auto complete
inoremap <C-Space> <C-x><C-o>

" Auto complete - XML Tags
" inoremap <lt>/ </<C-X><C-O>

" Folding
" http://vim.wikia.com/wiki/Folding
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Indent
nnoremap <leader>i mqHmwgg=G`wzt`q

" Yank all
nmap ya :%y+<CR>

" Center search results
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" VimGrep ----------------------------------------------------------------------

" nmap <leader>g :noautocmd vimgrep //j ./**/*<C-Left><C-Left><Right>
nmap <leader>g :call GrepInFiles()<CR>

" Quickfix ---------------------------------------------------------------------

nmap <script> <silent> <F9>  :call ToggleLocationList()<CR>
nmap <script> <silent> <F10> :call ToggleQuickfixList()<CR>
nmap <f11>   :cprev<cr>
nmap <s-f11> :cpfile<cr>
nmap <c-f11> :colder<cr>
nmap <f12>   :cnext<cr>
nmap <s-f12> :cnfile<cr>
nmap <c-f12> :cnewer<cr>

"-------------------------------------------------------------------------------
" GUI SETTINGS
"-------------------------------------------------------------------------------

if has("mac")
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
elseif has("win32")
    source $VIMRUNTIME/mswin.vim
    au VimEnter * set lines=50 columns=150
    set guifont=Powerline_Consolas:h10:cANSI
    set guifontwide=NanumGothicCoding:h10cDEFAULT
    lang mes en_US      " language
    cd $HOME/Notes      " set pwd
endif

if has("gui_running")
    set guioptions-=m   " remove menu bar
    set guioptions-=T   " remove toolbar
    set guioptions-=r   " remove right scroll bar
    set guioptions-=L   " remove left scroll bar
endif

"-------------------------------------------------------------------------------
" FUNCTIONS
"-------------------------------------------------------------------------------

" Remove quickfix from buffer list
au BufEnter * if &buftype==#'quickfix' | set nobuflisted | endif

function! GrepInFiles()
    call inputsave()
    let search = input('Grep in '.getcwd().' > ')
    call inputrestore()
    if !empty(search)
        execute ':noautocmd vimgrep /'.search.'/j ./**/*'
        execute ':let @/="'.search.'"'
        copen
    endif
endfunction

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
" PLUGIN SETTINGS
"-------------------------------------------------------------------------------

" Flattown 
colorscheme flattown
au ColorScheme * hi Title guifg=#b8d977 guibg=NONE guisp=NONE gui=NONE ctermfg=150 ctermbg=NONE cterm=NONE

" Airline
if has("gui_running")
    let g:airline_powerline_fonts = 1                   " Use powerline font
endif
let g:airline#extensions#tabline#enabled = 1        " Enable tabline
let g:airline#extensions#tabline#fnamemod = ':t'    " Just show the filename

" EasyMotion
let g:EasyMotion_leader_key = ';' 

" NERDTree
let NERDTreeChDirMode       = 2         " Sync pwd with NERDTree root
let NERDTreeShowBookmarks   = 1         " Always show bookmarks
nnoremap <C-e> :NERDTreeToggle<CR> 
nnoremap <leader>e :NERDTreeFind<CR>

" Rainbow
let g:rainbow_active = 1                " Enable rainbow

" Smooth scroll
if has("gui_running")
    noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
    noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
    noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
    noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
endif

" CtrlP
let g:ctrlp_working_path_mode = 'rw'    " Use pwd as working directory
nnoremap <leader>f :CtrlP<CR>

" DelimitMate
let delimitMate_expand_cr = 1           " Add new line after {

" Tabularize
" Markdown table align
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.md setf markdown

