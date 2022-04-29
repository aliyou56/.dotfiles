let mapleader=" "

set noshowmode
set laststatus=2

set nowrap

let g:rainbow_active = 1
let g:markdown_fenced_languages = ['html', 'python', 'ruby', 'vim', 'scala']

call plug#begin('~/vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'gruvbox-community/gruvbox'
Plug 'mg979/vim-visual-multi'
Plug 'itchyny/lightline.vim'       " Lightline status bar
Plug 'frazrepo/vim-rainbow'

Plug 'triglav/vim-visual-increment'

call plug#end()

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <leader>gco :GCheckout<CR>

colorscheme gruvbox
set background=dark

runtime ftplugin/man.vim " Show man page in vim

syntax on
set number relativenumber
set smartcase
set incsearch
set scrolloff=8
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set smartcase
set ruler
set termguicolors

" Autocompletion
set wildmode=longest,list,full

" Fix splitting
set splitbelow splitright

set nrformats=alpha " vim-visual-increment

nnoremap <leader>e :Explore<CR>

" splits
nnoremap <leader>v :vsp<CR>
nnoremap <leader>V :sp<CR>
nnoremap <leader>h <C-W>h
nnoremap <leader>l <C-W>l
nnoremap <leader>k <C-W>k
nnoremap <leader>j <C-w>j

" buffers
nnoremap <leader>b :buffers<CR>:b

" Learn the hjkl
" nnoremap <Up> <NOP>
" nnoremap <Down> <NOP>
" nnoremap <Left> <NOP>
" nnoremap <Right> <NOP>

nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>

" macvim
"set guifont=Source \ Code \ Powerline:12

