" Code for the plug plugin manager https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

Plug 'fatih/molokai'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
" " Provide easy code formatting in Vim by integrating existing code formatters.
Plug 'Chiel92/vim-autoformat'

" " Syntax checking hacks for vim
Plug 'scrooloose/syntastic'

Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'

" " Programming Languages features

Plug 'hashivim/vim-terraform'
Plug 'fatih/vim-go'
Plug 'moll/vim-node'
Plug 'rust-lang/rust.vim'

" " Provide autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}

call plug#end()

" config code here
syntax on

set number

set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai

" " Perform terraform FMT on save
let g:terraform_fmt_on_save = 1

" " Perform rust FMT on save
let g:rustfmt_autosave = 1

" " Make NERDTree always open on the right side
let g:NERDTreeWinPos = "left"

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


" " vim-go Settings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" " syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

" " Use deoplete.
let g:deoplete#enable_at_startup = 1

