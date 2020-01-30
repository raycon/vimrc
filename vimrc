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
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

"-------------------------------------------------------------------------------
" vim-plug
"-------------------------------------------------------------------------------

" Do not use https request to download bundles
let $GIT_SSL_NO_VERIFY = 'true'

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'blerins/flattown'          " Color scheme
Plug 'scrooloose/nerdtree'       " File explorer
Plug 'bling/vim-airline'         " Beautiful status line
Plug 'easymotion/vim-easymotion' " Source navigation
Plug 'Yggdroot/indentLine'       " Indent guide line
Plug 'tpope/vim-sensible'        " Defaults everyone can agree

" Initialize plugin system
call plug#end()

"-------------------------------------------------------------------------------
" GLOBAL SETTINGS
"-------------------------------------------------------------------------------

" Set 7 line padding to cursor
set so=7

" Highlight current line
" set cursorline

" Space and Tab     " Use 4 spaces instead of tab
set tabstop=4       " Column counts for tab
set shiftwidth=4    " Column counts for <<, >>
set softtabstop=4   " Space count for tab key in INSERT mode
set expandtab       " Use spaces instead of tabs
set breakindent     " Every wrapped line will continue visually indented

" Search
set wrapscan        " Search wrap lines
set ignorecase      " Search ignore case
set smartcase       " /foo matches FOO and fOo, but /FOO only matches the former
set hlsearch        " Enable search highlighting

" Any buffer can be hidden (keeping its changes) without write
set hidden

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set noswapfile

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Get rid of | character in split bar
set fillchars+=vert:\  

" Omni completion
" http://vim.wikia.com/wiki/Omni_completion
" set omnifunc=syntaxcomplete#Complete

" Change keyboard layout to english in normal mode
set noimdisable
set iminsert=1
set imsearch=-1

" Show line numbers
set number

" tmux Background Color Erase
set t_ut=    

" foo-bar as word
set iskeyword+=-

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
" nmap <leader>w :w!<CR>

" Replace word under the cursor
nnoremap <leader>r :%s/\<<C-r><C-w>\>//gcl<Left><Left><Left><Left>

" Buffer navigation
nnoremap <c-n> :bn<CR>
" nnoremap <c-p> :bp<CR>

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
nmap <silent> <leader>h :setlocal hlsearch! hlsearch?<CR>

" Toggle wrap mode
nmap <silent> <leader>w :setlocal wrap!<CR>:setlocal wrap?<CR>

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
nnoremap S "_diwP

" Center search results
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" VimGrep ----------------------------------------------------------------------

" nmap <leader>g :noautocmd vimgrep //j ./**/*<C-Left><C-Left><Right>
nmap <leader>gf :call GrepInFiles()<CR>
nmap <leader>gb :call GrepInBuffers()<CR>

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

if has ("gui_gtk2")
    set guifont=consolas\ 10
elseif has("mac")
    set guifont=D2Coding:h12
elseif has("win32")
    au VimEnter * set lines=60 columns=180
    set guifont=D2Coding:h11
    lang mes ko_KR.UTF-8 " language
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
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

function! BufferList()
    let all = range(0, bufnr('$'))
    let res = []
    for b in all
        if buflisted(b)
            call add(res, bufname(b))
        endif
    endfor
    return res
endfunction

function! GrepInBuffers()
    call inputsave()
    let search = input('Grep in buffers > ')
    call inputrestore()
    if !empty(search)
        execute ':noautocmd vimgrep /'.search.'/ '.join(BufferList())
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
let g:airline_powerline_fonts = 1                   " Use powerline font
let g:airline#extensions#tabline#enabled = 1        " Enable tabline
let g:airline#extensions#tabline#fnamemod = ':t'    " Just show the filename

" EasyMotion
let g:EasyMotion_leader_key = ';' 

" NERDTree
let NERDTreeChDirMode       = 2         " Sync pwd with NERDTree root
let NERDTreeShowBookmarks   = 1         " Always show bookmarks
nnoremap <C-e> :NERDTreeToggle<CR> 
nnoremap <leader>e :NERDTreeFind<CR>

" IndentLine
let g:indentLine_char = '¦¢'
