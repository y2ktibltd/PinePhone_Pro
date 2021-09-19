#!/bin/bash
useradd -mG wheel $1
passwd $1
pacman -Syu htop tmux base-devel  git curl  xorg xterm cmake nano vim python-setuptools

cd /opt
git clone https://aur.archlinux.org/yay-git.git

chown -R $1:$1 ./yay-git

cd yay-git
makepkg -si

yay -S qtile 

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#launch vim
#PlugInstall
#exit vim
.vim/plugged/YouCompleteMe/install.py
