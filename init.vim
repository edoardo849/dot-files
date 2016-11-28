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
Plug 'racer-rust/vim-racer'

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

" let g:Guifont = "DejaVu Sans Mono:h13"


" " Perform terraform FMT on save
let g:terraform_fmt_on_save = 1

" " RUST
let g:rustfmt_autosave = 1
set hidden
let g:racer_cmd = "~/.cargo/bin/racer"
let $RUST_SRC_PATH="~/src/rust/src"


" " Make NERDTree always open on the right side
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden = 1


" DTreeShowHidden=1to the space key
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
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"

" " syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

" " Use deoplete.
let g:deoplete#enable_at_startup = 1
let b:deoplete_ignore_sources = ['buffer']


" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
	let l:file = expand('%')
	if l:file =~# '^\f\+_test\.go$'
		call go#cmd#Test(0, 1)
	elseif l:file =~# '^\f\+\.go$'
		call go#cmd#Build(0)
	endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
" Toggle gocover on super + C
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
