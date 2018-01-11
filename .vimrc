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

" ==== LATEX ====
inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
map <Space><Tab> <Esc>/<++><Enter>"_c4l
inoremap ;gui <++>
autocmd FileType tex inoremap <F5> <Esc>:!xelatex<spacE><c-r>%<Enter>i
autocmd FileType tex nnoremap <F5> :!xelatex<spacE><c-r>%<Enter>
autocmd FileType tex inoremap ;fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
autocmd FileType tex inoremap ;fit \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ;fig \begin{figure}<Enter><Enter>\end{figure}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ;exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ;em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap ;bf \textbf{}<++><Esc>T{i
autocmd FileType tex vnoremap ; <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
autocmd FileType tex vnoremap : <ESC>`<i{\<ESC>`>2la}<ESC>?{\\<Enter>la
autocmd FileType tex inoremap {{ <Esc>F{i
autocmd FileType tex inoremap }} <Esc>f}a
autocmd FileType tex inoremap ;it \textit{}<++><Esc>T{i
autocmd FileType tex inoremap ;ct \textcite{}<++><Esc>T{i
autocmd FileType tex inoremap ;cp \parencite{}<++><Esc>T{i
autocmd FileType tex inoremap ;glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
autocmd FileType tex inoremap ;x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
autocmd FileType tex inoremap ;ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;li <Enter>\item<Space>
autocmd FileType tex inoremap ;ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap ;ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
autocmd FileType tex inoremap ;can \cand{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;con \const{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;v \vio{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;a \href{}{<++>}<Space><++><Esc>2T{i
autocmd FileType tex inoremap ;sc \textsc{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;chap \chapter{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;st <Esc>F{i*<Esc>f}i
autocmd FileType tex inoremap ;beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
"autocmd FileType tex inoremap ;up \usepackage{}<Esc>i
autocmd FileType tex inoremap ;up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex nnoremap ;up /usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap ;tt \texttt{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;bt {\blindtext}
autocmd FileType tex inoremap ;nu $\varnothing$
autocmd FileType tex inoremap ;col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
autocmd FileType tex inoremap ;rn (\ref{})<++><Esc>F}i

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




