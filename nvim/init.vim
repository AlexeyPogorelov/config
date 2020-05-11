" Settings
set encoding=utf-8
set autoread
set modifiable
set spell spelllang=en_us
set t_Co=256
syntax enable
set sessionoptions-=options

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
set nowritebackup

set noerrorbells                " No beeps
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set wildmenu                    " enhanced command line completion
set hidden                      " current buffer can be put into background
set cmdheight=2                 " command bar height
set nocompatible                " not compatible with vi

set history=4000                " remember more commands and search history
set undolevels=4000             " use many muchos levels of undo

" COC Autocomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set shortmess+=c
set signcolumn=yes

let g:coc_global_extensions = [
\ 'coc-html',
\ 'coc-json',
\ 'coc-tsserver',
\ 'coc-css',
\ 'coc-eslint',
\ 'coc-snippets',
\ 'coc-yank'
\ ]

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'digitaltoad/vim-jade'
Plug 'godlygeek/tabular'
Plug 'heavenshell/vim-jsdoc'
Plug 'herringtondarkholme/yats.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'morhetz/gruvbox'
Plug 'mxw/vim-jsx'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'rakr/vim-one'
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'scrooloose/nerdcommenter'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'tpope/vim-fugitive'
Plug 'vifm/vifm.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yuttie/comfortable-motion.vim'
call plug#end()

colorscheme gruvbox
set background=dark

" Emmet options
let g:user_emmet_leader_key=','
let g:user_emmet_install_global = 0
autocmd FileType scss,sass,css EmmetInstall

" ctrlp options
let g:ctrlp_map = '<F3>'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|(node_modules|dist|build)$',
  \ 'file': '\v\.(exe|so|dll|zip)$',
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

" TODO use this function as a command
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
" autocmd BufWritePre * :call TrimWhitespace()

" Git config
set updatetime=100

nnoremap g] <Plug>(GitGutterNextHunk)
nnoremap g[ <Plug>(GitGutterPrevHunk)
nnoremap gp <Plug>(GitGutterPreviewHunk)
nnoremap gu <Plug>(GitGutterUndoHunk)
nnoremap gs <Plug>(GitGutterStageHunk)

"key bindings
let mapleader = " "

set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

map <ESC><ESC> <C-\><C-N>
map <F1> :Goyo<CR>
map <F2> :mksession! ~/session.vim<CR>
map <F2><F2> :source ~/session.vim<CR>
map <F4> :set relativenumber!<CR>
map <F5> :EditVifm .<CR>
map <F6> :UndotreeToggle<CR>
map <F12> :tab new term://$SHELL <BAR> startinsert<CR>
map <F36> :split term://$SHELL <BAR> startinsert<CR>
command! E Explore
command! T :tab new term://$SHELL

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vmap <C-c> "+y<CR>
vmap <C-x> "+d<CR>
nmap <C-p> "+p<CR>

nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader>> :vertical resize +25<CR>
nnoremap <Leader>< :vertical resize -25<CR>
nnoremap <Leader>= :resize +25<CR>
nnoremap <Leader>- :resize -25<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>q :q<CR>

" COC

" tab to expand snippet
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

"pangloss/vim-javascript config
let g:javascript_plugin_jsdoc = 1

"suan/vim-instant-markdown
let g:instant_markdown_autostart = 0
"let g:instant_markdown_slow = 1
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1

"font settings
let g:webdevicons_enable = 1
let g:airline_powerline_fonts = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1

