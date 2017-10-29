set nocompatible
filetype off    "required
set exrc

" Remap leader
let mapleader = ","
let g:mapleader = ","

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ==== PLUGINS ====
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/L9'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'christoomey/vim-conflicted'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mattn/emmet-vim'
Plugin 'sjl/gundo.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'

" ==== PLUGIN THEMES ====
Plugin 'vim-scripts/darktango.vim'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'

" ==== END PLUGIN THEMES ====

" ==== PLUGIN SYNTAX ====
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'hdima/python-syntax'
Plugin 'othree/yajs.vim'
Plugin 'mitsuhiko/vim-jinja'
" ==== END PLUGIN SYNTAX ====

" ==== END PLUGINS ====

call vundle#end()
filetype plugin indent on

" ==== BASIC ====
set guifont=Monospace\ 10
set fillchars+=vert:\$
syntax enable
set ruler
set hidden
set number
set laststatus=2
set smartindent
set st=4 sw=4 et
set shiftwidth=4
set tabstop=4
let &colorcolumn="80"

" ==== COLORSCHEME ====
colorscheme gruvbox

" ==== NERDTREE ====
let NERDTreeIgnore = ['\.pyc$','\.o$','\.so$','\.a$','\swp','\.swo','\.swn','\.swm','[a-zA-Z]*egg[a-zA-Z]*','[a-zA-Z]*cache[a-zA-Z]*']
let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrrows=0
map <C-t> :NERDTreeToggle<CR>

" ==== SYNTASTIC ====
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set statusline+=%warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checker = ['eslint']
let g:syntastic_javascript_mri_args = "--config=$HOME/.jshintrc"
let g:syntastic_python_checker = ['pylint', 'flake8', 'pep8', 'pyflakes', 'python']
let g:syntastic_ymal_checker = ['ysyaml']
let g:syntastic_html_tidy_exec = 'tidy5'

" ==== SPELL CHECKING ====
map <leader><F5> :setlocal spall! spelllang=no_nb<CR>
map <leader><F6> :setlocal spell! spelllang=en_us<CR>

" ==== SAVING BINDS ====
nmap <leader>w :w!<CR>
command W w !sudo tee % > /dev/null

" ==== WOLD MENU ====
set wildmenu

" Configure backspace so it acts as it should
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Makes search act like search in modern browsers
set incsearch
set hlsearch

" Adds exstra margin on the left
set foldcolumn=1

" Background
set background=dark

" Encoding
set encoding=utf8

" Linebreak at 500 characters
set lbr
set tw=500
set ai      " Auto indent
set si      " Smart indent
set wrap    " Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""
" => Move around, tabs, windows
"""""""""""""""""""""""""""""""""""""""""""""""""
" Tab
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" ==== EASYMOTION ====
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap f <Plug>(easymotion-s)

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Map <Space> to / and Ctrl-<Space> to ? (Backwards search)
map <space> /
map <c-space> ?

" Returns to last edit position when optinging recent files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Status line
set laststatus=2

" Move line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>+`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mxgv`yo`z
vmap <M-k> :m'<-2<cr>`>my<mxgv`yo`z

" Delete trailing whitespace on save
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

" Omni complete functions
filetype plugin on
set omnifunc=syntastic#Complete

" NERDTree
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:MERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

set scrolloff=10
set secure




