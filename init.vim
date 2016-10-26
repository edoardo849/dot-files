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

colorscheme molokai 
