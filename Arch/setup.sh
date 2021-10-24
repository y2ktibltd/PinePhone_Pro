#!/bin/sh
echo "Please enter your new username"
read user
useradd -mG wheel $user
echo -e $user:$user | chpasswd

pacman -Syu --noconfirm tmux gdb clang #curl vim nano htop base-devel git curl cmake python-setuptools xorg xterm

git clone https://aur.archlinux.org/yay-git.git /opt/yay-git
chown -R $user:$user /opt/yay-git

cd /opt/yay-git
echo "y" | sudo -S -u $user makepkg -si

sudo -S -u $user yay -S --noconfirm qtile

sudo -S -u $user echo "alias ll='ls -lah --color=auto'">>/home/$user/.bashrc

sudo -S -u $user curl -fLo /home/$user/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo -S -u $user echo """syntax on

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
call plug#end()""" > /home/$user/.vimrc

sudo -S -u $user vim -c :PlugInstall +qall +qall
echo $user | su $user /home/$user/.vim/plugged/YouCompleteMe/install.py
