" Settings
set encoding=utf-8
set autoread
set modifiable
set spell spelllang=en_us
set t_Co=256
syntax enable
set sessionoptions-=options

set tabstop=4
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
set timeoutlen=500

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
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'mbbill/undotree'
Plug 'morhetz/gruvbox'
Plug 'mxw/vim-jsx'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'rakr/vim-one'
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'scrooloose/nerdcommenter'
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-fugitive'
Plug 'vifm/vifm.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yuttie/comfortable-motion.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
call plug#end()

let g:gruvbox_contrast_light='hard'
let g:gruvbox_contrast_dark='medium'
colorscheme gruvbox
set background=dark

function! ToggleScheme()
    if (&background == "light")
      set background=dark
    else
       set background=light
    endif
endfunction

" GitGutter config
let g:gitgutter_map_keys = 0

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

" FZF
let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.95 } }

"key bindings
let mapleader = " "

set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" map <F1> :call Test()<CR>
map <F1> :split term://$SHELL <BAR> startinsert<CR>
map <F2> :mksession! ~/session.vim<CR>
map <F2><F2> :source ~/session.vim<CR>
map <F3> :buffers<CR>:buffer<Space>
map <F4> :set relativenumber!<CR>
map <F5> :EditVifm %<CR>
map <F6> :UndotreeToggle<CR>
map <F7> :Gvdiffsplit<CR>
map <F8> :Gvdiffsplit!<CR>
map <F11> :call ToggleScheme()<CR>
map <F12> :tab new term://$SHELL <BAR> startinsert<CR>
map <F29> :!nautilus % &<CR>
map <F36> :split term://$SHELL <BAR> startinsert<CR>
command! B Buffers
command! E Explore
command! F GFiles
command! P CocFix
command! T :tab new term://$SHELL
tnoremap <ESC><ESC> <ESC>
tnoremap <C-[> <C-\><C-n>
nmap <Leader>i <Plug>(Prettier)

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vmap <C-c> "+y<CR>
vmap <C-x> "+d<CR>
nmap <C-p> "+p<CR>
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a
vnoremap <C-s> <Esc>:w<CR>

tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <C-up> :resize +5<CR>
nnoremap <C-down> :resize -5<CR>
nnoremap <C-left> :vertical resize -5<CR>
nnoremap <C-right> :vertical resize +5<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>q :q<CR>
nnoremap <leader>e :E<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>n :noh<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>t :tab split<bar> :E<CR>
nnoremap <leader>s :tab split<CR>
nnoremap <leader>o :MaximizerToggle<CR>

nnoremap <leader>] :GitGutterNextHunk<CR>
nnoremap <leader>[ :GitGutterPrevHunk<CR>
nnoremap <leader>p :GitGutterPreviewHunk<CR>
nnoremap <leader>pu :GitGutterUndoHunk<CR>
nnoremap <leader>ps :GitGutterStageHunk<CR>

nnoremap <leader>b :Buffers<CR>

" Apply AutoFix to problem on the current line.
nnoremap <leader>pf  <Plug>(coc-fix-current)

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

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

"font settings
let g:webdevicons_enable = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

function! Test()
  let bufcount = bufnr("$")
  let currbufnr = 1
  let nummatches = 0
  let firstmatchingbufnr = 0
  while currbufnr <= bufcount
    if(bufexists(currbufnr))
      let currbufname = bufname(currbufnr)
      if(match(currbufname, a:pattern) > -1)
        echo currbufnr . ": ". bufname(currbufnr)
        let nummatches += 1
        let firstmatchingbufnr = currbufnr
      endif
    endif
    let currbufnr = currbufnr + 1
  endwhile
  if(nummatches == 1)
    execute ":buffer ". firstmatchingbufnr
  elseif(nummatches > 1)
    let desiredbufnr = input("Enter buffer number: ")
    if(strlen(desiredbufnr) != 0)
      execute ":buffer ". desiredbufnr
    endif
  else
    echo "No matching buffers"
  endif
endfunction

