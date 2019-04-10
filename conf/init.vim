call plug#begin()

Plug 'fatih/molokai'
Plug 'scrooloose/nerdtree'

" " Provide easy code formatting in Vim by integrating existing code formatters.
Plug 'Chiel92/vim-autoformat'


call plug#end()

" config code

syntax on

let g:molokai_original = 1
let g:rehash256 = 1

colorscheme molokai

" NerdTree config
" " Make NERDTree always open on the right side
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden = 1

" DTreeShowHidden=1to the space key
let mapleader = "\<Space>"

" " Type <Space>o to open a new file
nnoremap <Leader>o :CtrlP<CR>

" " Type <Space>w to save file
nnoremap <Leader>w :w<CR>

" " Type <Space>q to quit file
nnoremap <Leader>q :q<CR>
" " Copy & paste to system clipboard with <Space>p and <Space>y
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" " Open NerdTree with <Space>n
map <Leader>n  :NERDTreeToggle<CR>
nmap <Leader>t :TagbarToggle<CR>

" " have your code be formatted upon saving your file, depending on Chiel92/vim-autoformat
au BufWrite * :Autoformat

" " Enter visual line mode with <Space><Space>
nmap <Leader><Leader> V
