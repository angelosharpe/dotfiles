set nocompatible
set hidden

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'davidhalter/jedi-vim'
Plug 'bling/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'tomtom/tcomment_vim'
Plug 'easymotion/vim-easymotion'
Plug 'mileszs/ack.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
call plug#end()

""""""""""""""""""""""""""""""""" Nerd tree
" Ctrl+n to open nerd tree
map <C-n> :NERDTreeToggle<CR>
" show nerd tree in empty buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" ignore .pyc etc.
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

""""""""""""""""""""""""""""""""" Syntactic
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
""""""""""""""""""""""""""""""""" jedi-vim
"let g:jedi#use_splits_not_buffers = "left"
""""""""""""""""""""""""""""""""" Ack(ag)
if executable('ag')
    let g:ackprg = 'ag --smart-case'
endif

cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack
""""""""""""""""""""""""""""""""" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
""""""""""""""""""""""""""""""""" vim-session
let g:session_autosave_periodic = 5
let g:session_autoload = 'yes'
""""""""""""""""""""""""""""""""" Settings
" Set to auto read when a file is changed from the outside
set autoread
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" For regular expressions turn magic on
set magic
" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase
" Highlight search results
set hlsearch
" Turn backup off, since most stuff is in SVN, git etc. anyways...
set nobackup
set nowb
set noswapfile
set termencoding=utf-8
set number
set showmode
set showcmd
set ruler
set ignorecase
set incsearch
set confirm
syntax on
set laststatus=2

""""""""""""""""""""""""""""""' tab/pane nav 1
"" pane navigation
"nnoremap <C-Down> <C-W><C-J>
"nnoremap <C-Up> <C-W><C-K>
"nnoremap <C-Right> <C-W><C-L>
"nnoremap <C-Left> <C-W><C-H>
"
"" tab navigation
"nnoremap <C-h> :tabprevious<CR>
"nnoremap <C-l> :tabnext<CR>
""""""""""""""""""""""""""""""' / tab/pane nav 1
""""""""""""""""""""""""""""""' tab/pane nav 2
" buffer navigation
nnoremap <C-Right> :bnext<CR>
nnoremap <C-Left> :bprevious<CR>
nnoremap <C-x> :bp\|bd #<CR>

"switch to pane up
nnoremap <Esc>[1;3A <C-W><C-K>
"switch to pane down
nnoremap <Esc>[1;3B <C-W><C-J>
"switch to pane right
nnoremap <Esc>[1;3C <C-W><C-L>
"switch to left pane
nnoremap <Esc>[1;3D <C-W><C-H>
""""""""""""""""""""""""""""""' / tab/pane nav 2

" move lines
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" map <C-m> :make
set spelllang=en
set modeline
set mouse=a
set encoding=utf-8
set cursorline
set foldlevelstart=20
set foldmethod=syntax

autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif

" show tabs as blank-padded arrows, trailing spaces as middle-dots
set list
set listchars=tab:→\ ,trail:·,precedes:⇐,extends:⇒

" Highlight lines longer than 80 characters
":au BufWinEnter * let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
":au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
":au BufWinLeave * call clearmatches()
if exists('+colorcolumn')
  set colorcolumn=80
endif

" Make frequent typos work.
command Q :q
command W :w
command Wq :wq
command WQ :wq
nmap <leader>w :w!<cr>

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 20 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='20,\"100,:20,%,n~/.vim/viminfo

" remove scrollbars
set go-=r go-=R go-=l go-=L go-=b

" themes
colorscheme monokai

" font
set guifont=Monospace\ 9

" tabs
au FileType python setl shiftwidth=4 tabstop=4 smartindent noexpandtab

