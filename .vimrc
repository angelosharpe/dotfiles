set termencoding=utf-8
set shiftwidth=8
set number
set showmode
set showcmd
set ruler
set ignorecase
set incsearch
set smartindent
set confirm
syntax on
map <C-l> :tabnext<CR>
map <C-h> :tabprev<CR>
map <C-x> :q<CR>
map <C-c> :tabnew
map <C-m> :make
set spelllang=en
set modeline
set mouse=a
set encoding=utf-8
set cursorline
set foldlevelstart=20
set foldmethod=syntax
"so ~/.vim/shortcut.vim
"so ~/.vim/skeletons.vim
set noeb vb t_vb=

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

filetype plugin indent on
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType c,cpp setlocal noexpandtab shiftwidth=4 softtabstop=4

autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif

nnoremap <silent> <F9> :TlistToggle<CR>
nnoremap <silent> <F8> :set spell!<CR>
nnoremap <silent> <F5> :!make<CR>
nnoremap <silent> <F10> :set spelllang=en<CR>
nnoremap <silent> <F11> :set spelllang=cs<CR>
let g:proj_flags='imstg'

" show tabs as blank-padded arrows, trailing spaces as middle-dots
set list
set listchars=tab:→\ ,trail:·,precedes:⇐,extends:⇒

" Highlight lines longer than 80 characters
:au BufWinEnter * let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
:au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
:au BufWinLeave * call clearmatches()

" Make frequent typos work.
command Q :q
command W :w
command Wq :wq
command WQ :wq

" Automatically change directory to the one containing the current file.
autocmd BufEnter * silent! lcd %:p:h

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
colorscheme zenburn
colors zenburn

" font
set guifont=Monospace\ 9

" kernel tags
set tags=./tags,tags,../tags,../../tags,../../../tags,../../../../tags
