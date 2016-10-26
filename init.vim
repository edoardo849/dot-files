" Code for the plug plugin manager https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

Plug 'fatih/molokai'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'fatih/vim-go'
Plug 'moll/vim-node'

call plug#end()

" config code here
syntax on

set number

let g:molokai_original = 1
let g:rehash256 = 1

" " Map the leader to the space key
let mapleader = "\<Space>"

" " Type <Space>o to open a new file
nnoremap <Leader>o :CtrlP<CR>

" " Type <Space>w to save file
nnoremap <Leader>w :w<CR>

" " Copy & paste to system clipboard with <Space>p and <Space>y
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" " Enter visual line mode with <Space><Space>
nmap <Leader><Leader> V

colorscheme molokai 
