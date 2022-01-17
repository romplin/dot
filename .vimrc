syntax enable
set number
set ruler
set showcmd
set shiftwidth=4
set softtabstop=0
set tabstop=4
set hlsearch
set incsearch
set ignorecase
set noswapfile
set clipboard=unnamed
  
 
call plug#begin('~/.vim/plugged')
  
Plug 'vim-airline/vim-airline'
Plug 'arzg/vim-rust-syntax-ext'
Plug 'fatih/vim-go'
Plug 'TovarishFin/vim-solidity'
Plug 'posva/vim-vue'
Plug 'preservim/nerdtree'
Plug 'jelera/vim-javascript-syntax'
 
call plug#end()
 
nmap <F3> :NERDTreeToggle<CR>
