syntax on

set nu
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set noerrorbells visualbell t_vb=
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

highlight ColorColumn ctermbg=0 guibg=black

call plug#begin()
Plug 'jpalardy/vim-slime', { 'for':['python','julia']}
Plug 'hanschen/vim-ipython-cell',{ 'for':['python','julia']}
Plug 'JuliaEditorSupport/julia-vim'
Plug 'morhetz/gruvbox'
Plug 'Valloric/YouCompleteMe'
Plug 'mbbill/undotree'
Plug 'vim-utils/vim-man'
call plug#end()
