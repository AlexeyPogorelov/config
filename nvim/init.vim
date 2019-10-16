" Settings
set encoding=utf-8
set autoread
set modifiable
set spell spelllang=en_us
set t_Co=256
syntax enable
set termguicolors

set tabstop=2
set shiftwidth=2
set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling
set expandtab                   " splits tab to spaces
set autoindent
set number relativenumber       " show numbers
set list                        " show whitespaces
set listchars=tab:>\ ,trail:~,extends:>,precedes:<,space:·

" Searching
set ignorecase                  " case insensitive searching
set smartcase                   " case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch                   " set incremental search, like modern browsers
set showmatch                   " show matching braces

" make backspace behave in a sane manner
set backspace=indent,eol,start

" set undodir="~/temp/.vim//"
" set undofile
" set backupdir=$HOME."/temp/.vim//"

set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files

set noerrorbells                " No beeps
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set wildmenu                    " enhanced command line completion
set hidden                      " current buffer can be put into background
set cmdheight=1                 " command bar height
set nocompatible                " not compatible with vi

set history=4000                " remember more commands and search history
set undolevels=4000             " use many muchos levels of undo

call plug#begin('~/.vim/plugged')
Plug 'neomake/neomake'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'thinca/vim-quickrun'
Plug 'cohama/agit.vim'
Plug 'rakr/vim-one'
Plug 'jiangmiao/auto-pairs'
Plug 'heavenshell/vim-jsdoc'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim'
Plug 'jwalton512/vim-blade'
Plug 'mxw/vim-jsx'
Plug 'kchmck/vim-coffee-script'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'wavded/vim-stylus'
Plug 'godlygeek/tabular'
Plug 'yuttie/comfortable-motion.vim'
Plug 'mbbill/undotree'
call plug#end()

colorscheme gruvbox
set background=dark

" Emmet options
let g:user_emmet_leader_key=','
let g:user_emmet_install_global = 0
autocmd FileType scss,sass,css EmmetInstall

" ctrlp options
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|(node_modules|dist|build)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"Netrw options
let g:netrw_banner=0

"Airline options
let g:airline_powerline_fonts=1
let g:airline_theme='one'
let g:airline_detect_spell=0
let g:airline_detect_spelllang=0
let g:airline_skip_empty_sections=1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_buffers = 0

" Neomake
"autocmd! BufWritePost * Neomake

" Git config
set updatetime=100

"key bindings
tnoremap <ESC><ESC> <C-\><C-N>
noremap <F3> :set list!<CR>
noremap <F4> :set relativenumber!<CR>
nnoremap <F5> :UndotreeToggle<CR>
command! E Explore

"pangloss/vim-javascript config
let g:javascript_plugin_jsdoc = 1

"font settings
let g:webdevicons_enable = 1
let g:airline_powerline_fonts = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1

