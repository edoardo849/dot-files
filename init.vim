" Code for the plug plugin manager https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

Plug 'fatih/molokai'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'fatih/vim-go'
Plug 'moll/vim-node'
" " Provide easy code formatting in Vim by integrating existing code formatters.
Plug 'Chiel92/vim-autoformat'

" " Provide autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}

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

" " Open NerdTree with <Space>n
map <Leader>n  :NERDTreeToggle<CR>


" " have your code be formatted upon saving your file, depending on Chiel92/vim-autoformat
au BufWrite * :Autoformat

" " Enter visual line mode with <Space><Space>
nmap <Leader><Leader> V

colorscheme molokai
