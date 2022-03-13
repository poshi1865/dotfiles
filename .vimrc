"General Settings
syntax on
set noerrorbells
set backspace=indent,eol,start
set relativenumber
set nu
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set nowrap

set signcolumn=yes
highlight clear SignColumn

set noshowmode
set laststatus=2

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set mouse=a

set incsearch
set smartcase
set scrolloff=8

set ttimeoutlen=10

"Shifting windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Changing tabs
nnoremap <F1> :tabprevious<CR>
nnoremap <F2> :tabnext<CR>

"Matching Brackets
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}

"Compiling 
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!clear;python3' shellescape(@%, 1)<CR>
autocmd filetype c nnoremap <F9> :w <bar> exec '!clear;gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F9> :w <bar> exec '!clear;g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

"vim-plug
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <silent> <C-p> :Files<CR>

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'preservim/nerdtree'
let g:NERDTreeWinPos = "left"
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'

Plug 'octol/vim-cpp-enhanced-highlight'
let g:cpp_no_function_highlight = 1
let g:c_no_function_highlight = 1

Plug 'tmsvg/pear-tree'
Plug 'morhetz/gruvbox'

Plug 'itchyny/lightline.vim'

call plug#end()

"Coc 
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

let g:gruvbox_contrast_dark='hard'
set background=dark
colorscheme gruvbox
