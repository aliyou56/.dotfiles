"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noshowmode " prevent non-normal modes showing in powerline and below powerline.
set laststatus=2 " always show statusline

set nocompatible " use vim settings, rather than Vi
filetype off

syntax on
set path+=**				    	" Searches current directory recursively.
set wildmenu				     	" Display all matches when tab complete.
set incsearch             " Incremental search
" set hidden              " Needed to keep multiple buffers open
set nobackup              " No auto backups
set noswapfile            " No swap
set t_Co=256              " Set if term supports 256 colors.
set number relativenumber " Display line numbers
set clipboard=unnamedplus " Copy/paste between vim and other programs.
set smartcase
" undodir=~/.vim/undodir
" undofile
set ruler
set termguicolors
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab              " Use spaces instead of tabs.
" set smarttab
set smartindent
set autoindent
set scrolloff=8
set signcolumn=yes
set colorcolumn=100

let mapleader=" "
let g:rehash256 = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle For Managing Plugins
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/vim/plugged')

"{{ The Basics }}
  "Plug 'gmarik/Vundle.vim'                           " Vundle
  Plug 'itchyny/lightline.vim'                       " Lightline statusbar
  "Plug 'suan/vim-instant-markdown', {'rtp': 'after'} " Markdown Preview
  Plug 'frazrepo/vim-rainbow'

"Plug 'nvim-telescope/telescope.nvim'

Plug 'gruvbox-community/gruvbox'
Plug 'godlygeek/tabular'
"Plug 'terryma/vim-multiple-cursors'
Plug 'mg979/vim-visual-multi'
Plug 'junegunn/goyo.vim'
Plug 'itchyny/lightline.vim'            " Lightline status bar
Plug 'frazrepo/vim-rainbow'

call plug#end()

colorscheme gruvbox
set background=dark

" nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search =vim.fn.input("Grep For > ")})<CR>

"set clipboard+=unamedplus          " check

" Autocompletion
set wildmode=longest,list,full

set splitbelow splitright

"au FileType scala,java,typescript call rainbow#load() " load rainbow for specific files
let g:rainbow_active = 1   " enable rainbow globally

nnoremap jk <esc>
nnoremap <leader>e :Explore<CR>

" system clipboard
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>Y "+yy
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>P "+P
vmap <leader>P "+P

" splits
nnoremap <leader>v :vsp<CR>
nnoremap <leader>V :sp<CR>
nnoremap <leader>h <C-W>h
nnoremap <leader>l <C-W>l
nnoremap <leader>k <C-W>k
nnoremap <leader>j <C-W>j

" buffers
nnoremap <leader>b :buffers<CR>:b

nnoremap Y yg$
" Keeping it centered
noremap n nzzzv
noremap N Nzzzv
noremap J mzJ`z
" Undo break point
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
" Jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

nmap <leader>o o<Esc>k
" nmap 00 0<Esc>j

inoremap <silent> <Bar> <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
"    Tabularize/|/l1
    Tabularize/\\\@<!|/l1
    normal! 0
    call search(repeat('[^|]*|', column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
