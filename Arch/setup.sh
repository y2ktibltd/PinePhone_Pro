#!/bin/sh
echo "Please enter your new username"
read user
useradd -mG wheel $user
echo -e $user:$user | chpasswd
pacman -Syu --noconfirm tmux gdb clang curl vim nano htop base-devel git curl cmake python-setuptools xorg xterm xorg-xinit
git clone https://aur.archlinux.org/yay-git.git /opt/yay-git
chown -R $user:$user /opt/yay-git
cd /opt/yay-git
echo $user | sudo -S -u $user makepkg -s
yay -S --noconfirm qtile
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
set incsearch

call plug#begin()
Plug 'JuliaEditorSupport/julia-vim'
Plug 'davidhalter/jedi-vim'
Plug 'vim-utils/vim-man'
Plug 'bfrg/vim-cpp-modern'
call plug#end()""" > /home/$user/.vimrc
sudo -S -u $user vim -c :PlugInstall +qall
sudo sed -i "/PermitRootLogin/c\PermitRootLogin no" /etc/ssh/sshd_config
sudo passwd -l alarm
sudo reboot
